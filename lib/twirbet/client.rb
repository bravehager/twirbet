# typed: true
# frozen_string_literal: true

require "twirbet/dsl"

module Twirbet
  class Client
    extend T::Sig
    include DSL

    sig { params(method_name: String, request: T.untyped).returns(T.untyped) }
    def call(method_name, request)
      method = rpc(method_name)
      raise ArgumentError, "Unknown method: #{method_name}" unless method
    end
  end
end
