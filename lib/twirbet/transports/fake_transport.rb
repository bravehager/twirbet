# typed: true
# frozen_string_literal: true

require "twirbet/transport"

module Twirbet
  module Transports
    class FakeTransport
      extend T::Sig
      include Transport

      sig { returns(T::Array[Transport::Request]) }
      attr_reader :requests

      sig { void }
      def initialize
        @requests = []
      end

      sig { override.params(request: Transport::Request).returns(Transport::Response) }
      def call(request)
        requests << request
        Transport::Response.new(200, {}, "")
      end

      sig { void }
      def clear
        requests.clear
      end
    end
  end
end
