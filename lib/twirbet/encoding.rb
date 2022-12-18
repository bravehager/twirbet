# typed: true
# frozen_string_literal: true

module Twirbet
  module Encoding
    class << self
      extend T::Sig

      sig { params(content_type: T.nilable(String)).returns(T::Boolean) }
      def supported?(content_type)
        content_type == "application/protobuf" || content_type == "application/json"
      end

      sig { params(request: T.untyped, klass: Class).returns(T.untyped) }
      def encode_request(request, klass)
        T.unsafe(klass).encode(request)
      end

      sig { params(request: Rack::Request).returns(T.untyped) }
      def decode_request(request)
        method = request.env["twirp.method"]
        raise "Missing `twirp.method` in request environment." if method.nil?

        decode(request.body.read, method.request, request.content_type)
      end

      sig { params(object: T.untyped, content_type: String).returns(T.untyped) }
      def encode(object, content_type)
        case content_type
        when "application/protobuf"
          T.unsafe(object).to_proto
        when "application/json"
          T.unsafe(object).to_json
        else
          raise "Unsupported content type: #{content_type}"
        end
      end

      sig { params(object: T.untyped, klass: Class, content_type: String).returns(T.untyped) }
      def decode(object, klass, content_type)
        case content_type
        when "application/protobuf"
          T.unsafe(klass).decode(object)
        when "application/json"
          T.unsafe(klass).decode_json(object)
        else
          raise "Unsupported content type: #{content_type}"
        end
      end
    end
  end
end
