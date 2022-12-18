# typed: true

require_relative "environment"

class Application
  extend T::Sig
  include Ping::PingService::Handler

  sig { override.params(request: Ping::PingRequest).returns(Ping::PingResponse) }
  def ping(request)
    Ping::PingResponse.new(message: "Pong!")
  end
end
