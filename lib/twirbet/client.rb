# typed: true
# frozen_string_literal: true

require "twirbet/dsl"
require "twirbet/encoding"
require "twirbet/transport"
require "twirbet/transports/net_http_transport"

module Twirbet
  class Client
    extend T::Sig
    include DSL

    sig { returns(String) }
    attr_reader :base_url

    sig { returns(String) }
    attr_reader :prefix

    sig { returns(Transport) }
    attr_reader :transport

    sig { params(base_url: String, prefix: String, transport: Transport).void }
    def initialize(base_url, prefix: "/twirp", transport: Transports::NetHTTPTransport.new)
      @base_url = base_url
      @prefix = prefix
      @transport = transport
    end

    sig { params(method_name: String, request: T.untyped, headers: T::Hash[String, String]).returns(T.untyped) }
    def call(method_name, request, headers = {})
      method = rpc(method_name)
      raise ArgumentError, "Unknown method: #{method_name}" unless method

      url = "#{base_url}#{prefix}/#{full_name}/#{method_name}"
      body = Encoding.encode_request(request, method.request)
      headers = headers.merge({ "Content-Type" => "application/protobuf" })

      response = transport.call(Transport::Request.new(url, body, headers))
      raise Twirbet::Error.from_response(response) if response.status != 200

      Encoding.decode(response.body, method.response, "application/protobuf")
    end
  end
end
