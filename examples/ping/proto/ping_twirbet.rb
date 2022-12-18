require_relative "ping_pb"

module Ping
  module PingService
    module Handler
      extend T::Sig
      extend T::Helpers

      abstract!

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
        @handler = handler
      end
    end

    class Client < Twirbet::Client
      extend T::Sig
      include Handler

      package "ping"
      service "PingService"

      rpc "Ping", PingRequest, PingResponse, ruby_method: :ping

      sig { params(request: PingRequest).returns(PingResponse) }
      def ping(request)
        call("Ping", request)
      end
    end
  end
end
