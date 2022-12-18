# typed: true
# frozen_string_literal: true

require "rack"
require "twirbet/dsl"
require "twirbet/encoding"
require "twirbet/errors"

module Twirbet
  class Service
    extend T::Sig
    include DSL

    sig { returns(T.untyped) }
    attr_reader :handler

    def initialize(handler)
      @handler = handler
    end

    sig { params(env: T.untyped).returns(T.untyped) }
    def call(env)
      request = Rack::Request.new(env)
      validate_request(request)

      method = request.env["twirp.method"]
      response = invoke_method(method, request)

      rack_response = Rack::Response.new(response, 200, "Content-Type" => request.content_type)
      rack_response.finish
    rescue => e
      Error.from_exception(e).to_rack_response.finish
    end

    private

    sig { params(method: Method, request: Rack::Request).returns(T.untyped) }
    def invoke_method(method, request)
      begin
        decoded_request = Encoding.decode_request(request)
      rescue => e
        raise MalformedError, "Error decoding request: #{e.message}"
      end
      response = handler.public_send(method.ruby_method, decoded_request)
      Encoding.encode(response, request.content_type)
    end

    sig { params(request: Rack::Request).void }
    def validate_request(request)
      validate_method(request)
      validate_content_type(request)
      validate_path(request)
    end

    sig { params(request: Rack::Request).void }
    def validate_method(request)
      return if request.post?

      raise BadRouteError, "Invalid HTTP method: #{request.request_method}. Only POST is allowed."
    end

    sig { params(request: Rack::Request).void }
    def validate_content_type(request)
      return if Encoding.supported?(request.content_type)

      raise BadRouteError, "Unsupported content type: #{request.content_type}."
    end

    sig { params(request: Rack::Request).void }
    def validate_path(request)
      path_parts = request.path_info.split("/")

      if path_parts.length < 3 || path_parts[-2] != full_name
        raise BadRouteError, "Invalid path: #{request.path_info}."
      end

      method_name = path_parts[-1]

      method = rpc(method_name)
      raise BadRouteError, "Invalid method: #{method_name}." if method.nil?

      request.env["twirp.method"] = method
    end
  end
end
