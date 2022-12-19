require "twirbet"
require_relative "clientcompat_pb"

module Twirp
  module Clientcompat
    module CompatService
      module Handler
        extend T::Sig
        extend T::Helpers

        interface!

        sig { abstract.params(request: Req).returns(Resp) }
        def real_method(request); end

        sig { abstract.params(request: Empty).returns(Empty) }
        def noop_method(request); end
      end

      class Service < Twirbet::Service
        extend T::Sig

        package "twirp.clientcompat"
        service "CompatService"

        rpc "Method", Req, Resp, ruby_method: :real_method
        rpc "NoopMethod", Empty, Empty, ruby_method: :noop_method

        sig { params(handler: Handler).void }
        def initialize(handler)
          super(handler)
        end
      end

      class Client < Twirbet::Client
        extend T::Sig
        include Handler

        package "twirp.clientcompat"
        service "CompatService"

        rpc "Method", Req, Resp, ruby_method: :real_method
        rpc "NoopMethod", Empty, Empty, ruby_method: :noop_method

        sig { override.params(request: Req).returns(Resp) }
        def real_method(request)
          call("Method", request)
        end

        sig { override.params(request: Empty).returns(Empty) }
        def noop_method(request)
          call("NoopMethod", request)
        end
      end
    end
  end
end
