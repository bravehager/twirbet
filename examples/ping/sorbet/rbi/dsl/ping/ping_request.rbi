# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `Ping::PingRequest`.
# Please instead update this file by running `bin/tapioca dsl Ping::PingRequest`.

class Ping::PingRequest
  sig { params(message: T.nilable(String)).void }
  def initialize(message: nil); end

  sig { returns(String) }
  def message; end

  sig { params(value: String).void }
  def message=(value); end
end
