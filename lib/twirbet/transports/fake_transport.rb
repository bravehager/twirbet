# typed: true
# frozen_string_literal: true

require "twirbet/transport"

module Twirbet
  module Transports
    class FakeTransport
      extend T::Sig
      include Transport

      sig { override.params(request: Transport::Request).returns(Transport::Response) }
      def call(request)
        Transport::Response.new(200, "")
      end
    end
  end
end
