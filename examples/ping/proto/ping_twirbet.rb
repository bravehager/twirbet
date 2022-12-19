# typed: true

require "twirbet"
require_relative "ping_pb"

module Ping
  module PingService
    module Handler
      extend T::Sig
      extend T::Helpers

      interface!

      sig { abstract.params(request: PingRequest).returns(PingResponse) }
      def ping(request); end
    end

    class Service < Twirbet::Service
      extend T::Sig

      package "ping"
      service "PingService"

      rpc "Ping", PingRequest, PingResponse, ruby_method: :ping

      sig { params(handler: Handler).void }
      def initialize(handler)
        super(handler)
      end
    end

    class Client < Twirbet::Client
      extend T::Sig
      include Handler

      package "ping"
      service "PingService"

      rpc "Ping", PingRequest, PingResponse, ruby_method: :ping

      sig { override.params(request: PingRequest, headers: T::Hash[String, String]).returns(PingResponse) }
      def ping(request, headers = {})
        call("Ping", request, headers)
      end
    end
  end
end
