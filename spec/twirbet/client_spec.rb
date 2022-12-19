# typed: false
# frozen_string_literal: true

require "shared_examples/dsl"
require "support/ping_twirbet"
require "twirbet/transports/fake_transport"

RSpec.describe(Twirbet::Client) do
  include_examples "Twirbet DSL"

  describe "#call" do
    subject(:client) { Ping::PingService::Client.new("http://localhost:8080", transport: transport) }

    let(:transport) { Twirbet::Transports::FakeTransport.new }

    it "returns the response" do
      response = client.call("Ping", Ping::PingRequest.new(message: ""))

      expect(response).to(eq(Ping::PingResponse.new(message: "")))
    end

    it "sends headers" do
      client.call("Ping", Ping::PingRequest.new(message: ""), "X-Test" => "test")
      request = transport.requests.first

      expect(request.headers).to(eq("Content-Type" => "application/protobuf", "X-Test" => "test"))
    end

    context "when the rpc method is not defined" do
      it "raises an argument error" do
        expect { client.call("Pong", Ping::PingRequest.new) }.to(raise_error(ArgumentError, "Unknown method: Pong"))
      end
    end
  end
end
