# typed: true
# frozen_string_literal: true

require "json"
require "rack"

module Twirbet
  class BaseError < StandardError
    extend T::Sig
    extend T::Helpers

    abstract!

    sig { abstract.returns(String) }
    def code
    end

    sig { abstract.returns(Integer) }
    def status
    end

    sig(:final) { returns(Rack::Response) }
    def to_rack_response
      Rack::Response.new(to_json, status, "Content-Type" => "application/json")
    end

    sig(:final) { returns(String) }
    def to_json
      T.unsafe(to_hash).to_json
    end

    sig(:final) { returns(T::Hash[String, String]) }
    def to_hash
      { "code" => code, "msg" => message }
    end
  end

  class UnknownError < BaseError
    extend T::Sig

    sig { override.returns(String) }
    def code
      "unknown"
    end

    sig { override.returns(Integer) }
    def status
      500
    end
  end

  class InvalidArgumentError < BaseError
    extend T::Sig

    sig { override.returns(String) }
    def code
      "invalid_argument"
    end

    sig { override.returns(Integer) }
    def status
      400
    end
  end

  class MalformedError < BaseError
    extend T::Sig

    sig { override.returns(String) }
    def code
      "malformed"
    end

    sig { override.returns(Integer) }
    def status
      400
    end
  end

  class BadRouteError < BaseError
    extend T::Sig

    sig { override.returns(String) }
    def code
      "bad_route"
    end

    sig { override.returns(Integer) }
    def status
      404
    end
  end

  class InternalError < BaseError
    extend T::Sig

    sig { override.returns(String) }
    def code
      "internal"
    end

    sig { override.returns(Integer) }
    def status
      500
    end
  end

  module Error
    extend T::Sig

    CODE_MAP = T.let({
      "unknown" => UnknownError,
      "invalid_argument" => InvalidArgumentError,
      "malformed" => MalformedError,
      "bad_route" => BadRouteError,
      "internal" => InternalError,
    }.freeze, T::Hash[String, T.class_of(BaseError)])

    class << self
      extend T::Sig

      sig { params(exception: Exception).returns(BaseError) }
      def from_exception(exception)
        case exception
        when BaseError
          exception
        else
          InternalError.new(exception.message)
        end
      end

      sig { params(json: String).returns(BaseError) }
      def from_json(json)
        hash = JSON.parse(json)
        from_hash(hash)
      end

      sig { params(hash: T::Hash[String, String]).returns(BaseError) }
      def from_hash(hash)
        build(hash.fetch("code", "unknown"), hash.fetch("msg", ""))
      end

      sig { params(code: String, message: String).returns(BaseError) }
      def build(code, message)
        CODE_MAP.fetch(code, UnknownError).new(message)
      end
    end
  end
end
