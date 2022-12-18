# typed: false
# frozen_string_literal: true

require "twirbet"
require_relative "proto/ping_twirbet"

class PingHandler
  extend T::Sig
  include Ping::PingService::Handler

  sig { override.params(request: Ping::PingRequest).returns(Ping::PingResponse) }
  def ping(request)
    Ping::PingResponse.new(message: "Pong!")
  end
end
