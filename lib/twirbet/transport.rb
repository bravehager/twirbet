# typed: true
# frozen_string_literal: true

module Twirbet
  module Transport
    extend T::Sig
    extend T::Helpers

    class Request
      extend T::Sig

      sig { returns(String) }
      attr_reader :url

      sig { returns(String) }
      attr_reader :body

      sig { returns(T::Hash[String, String]) }
      attr_reader :headers

      sig { params(url: String, body: String, headers: T::Hash[String, String]).void }
      def initialize(url, body, headers)
        @url = url
        @body = body
        @headers = headers
      end
    end

    class Response
      extend T::Sig

      sig { returns(Integer) }
      attr_reader :status

      sig { returns(T::Hash[String, String]) }
      attr_reader :headers

      sig { returns(String) }
      attr_reader :body

      sig { params(status: Integer, headers: T::Hash[String, String], body: String).void }
      def initialize(status, headers, body)
        @status = status
        @headers = headers
        @body = body
      end
    end

    interface!

    sig { abstract.params(request: Request).returns(Response) }
    def call(request)
    end
  end
end
