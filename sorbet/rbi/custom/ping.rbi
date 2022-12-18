# typed: true

class Ping::PingRequest
  sig { params(message: T.nilable(String)).void }
  def initialize(message: nil); end

  sig { returns(String) }
  def message; end

  sig { params(message: T.nilable(String)).void }
  def message=(message); end
end

class Ping::PingResponse
  sig { params(message: T.nilable(String)).void }
  def initialize(message: nil); end

  sig { returns(String) }
  def message; end

  sig { params(message: T.nilable(String)).void }
  def message=(message); end
end
