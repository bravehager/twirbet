# Twirbet

Twirbet is a Sorbet-friendly Ruby library for the Twirp RPC framework.

## Installation

Twirbet is available as a Ruby gem. To install it via Bundler, run:

```sh
bundle install twirbet
```

## Usage

### Defining a service

Twirbet does not provide code generation (yet).

You can use the `Twirbet::Service` and `Twirbet::Client` classes to implement
and call Twirp services.

Given a service defined in `ping.proto`:

```protobuf
syntax = "proto3";

service PingService {
  rpc Ping(PingRequest) returns (PingResponse);
}

message PingRequest {
  string message = 1;
}

message PingResponse {
  string message = 1;
}
```

Here's the corresponding Ruby code:

```ruby
require "twirbet"
require_relative "ping_pb"

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

    service "PingService"

    rpc "Ping", PingRequest, PingResponse, ruby_method: :ping

    sig { override.params(request: PingRequest).returns(PingResponse) }
    def ping(request)
      call("Ping", request)
    end
  end
end
```

### Implementing a service

Once you have defined a service, you can implement it by creating a class that
includes the `Handler` interface:

```ruby
class PingHandler
  include PingService::Handler

  sig { override.params(request: PingRequest).returns(PingResponse) }
  def ping(request)
    PingResponse.new(message: "Pong: #{request.message}")
  end
end
```

### Starting a server

All services are valid Rack applications. You can use any Rack server to start a
Twirp server.

```ruby
handler = PingHandler.new
service = PingService::Service.new(handler)

run service
```

### Calling a service

You can call a service using the client:

```ruby
client = PingService::Client.new("http://localhost:8080")

response = client.ping(PingRequest.new(message: "Hello, world!"))

puts response.message # => "Pong: Hello, world!"
```

### Using a different HTTP client library

Twirbet uses the built-in `Net::HTTP` library to make HTTP requests. You can use
a different HTTP library by implementing the `Twirbet::Transport` interface and
passing it to the client constructor:

For example, Twirbet provides a `Twirbet::Transports::FakeTransport` class that
can be used for testing:

```ruby
require "twirbet/transports/fake_transport"

transport = Twirbet::Transports::FakeTransport.new
client = PingService::Client.new("http://localhost:8080", transport: transport)

response = client.ping(PingRequest.new(message: "Hello, world!"))

puts response.message # => ""
```
