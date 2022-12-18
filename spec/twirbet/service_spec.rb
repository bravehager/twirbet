# typed: false
# frozen_string_literal: true

require "shared_examples/dsl"
require "support/ping_twirbet"

RSpec.describe(Twirbet::Service) do
  include_examples "Twirbet DSL"

  describe "#call" do
    let(:service) { Ping::PingService::Service.new(handler) }
    let(:handler) do
      Class.new do
        include Ping::PingService::Handler

        def ping(request)
          Ping::PingResponse.new(message: "Pong!")
        end
      end.new
    end
    let(:env) do
      Rack::MockRequest.env_for(
        "/ping.PingService/Ping",
        method: "POST",
        input: "",
        "CONTENT_TYPE" => "application/protobuf",
      )
    end

    it "returns a 200 response" do
      response = Rack::Response[*service.call(env)]

      expect(response.status).to(eq(200))
    end

    it "returns a protobuf content type" do
      response = Rack::Response[*service.call(env)]

      expect(response.headers["Content-Type"]).to(eq("application/protobuf"))
    end

    it "returns a protobuf response body" do
      response = Rack::Response[*service.call(env)]

      expect(Ping::PingResponse.decode(response.body.first)).to(eq(Ping::PingResponse.new(message: "Pong!")))
    end

    context "when the request is a GET" do
      let(:env) do
        Rack::MockRequest.env_for(
          "/ping.PingService/Ping",
          method: "GET",
          input: "",
          "CONTENT_TYPE" => "application/protobuf",
        )
      end

      it "returns a 404 response" do
        response = Rack::Response[*service.call(env)]

        expect(response.status).to(eq(404))
      end

      it "returns a bad route error" do
        response = Rack::Response[*service.call(env)]
        error = Twirbet::Error.from_json(response.body.first)

        expect(error).to(be_a(Twirbet::BadRouteError))
      end

      it "returns expected error message" do
        response = Rack::Response[*service.call(env)]
        error = Twirbet::Error.from_json(response.body.first)

        expect(error.message).to(eq("Invalid HTTP method: GET. Only POST is allowed."))
      end
    end

    context "when the request does not have a content type" do
      let(:env) do
        Rack::MockRequest.env_for(
          "/ping.PingService/Ping",
          method: "POST",
          input: "",
        )
      end

      it "returns a 404 response" do
        response = Rack::Response[*service.call(env)]

        expect(response.status).to(eq(404))
      end

      it "returns a bad route error" do
        response = Rack::Response[*service.call(env)]
        error = Twirbet::Error.from_json(response.body.first)

        expect(error).to(be_a(Twirbet::BadRouteError))
      end

      it "returns expected error message" do
        response = Rack::Response[*service.call(env)]
        error = Twirbet::Error.from_json(response.body.first)

        expect(error.message).to(eq("Unsupported content type: ."))
      end
    end

    context "when the request has an unsupported content type" do
      let(:env) do
        Rack::MockRequest.env_for(
          "/ping.PingService/Ping",
          method: "POST",
          input: "",
          "CONTENT_TYPE" => "text/plain",
        )
      end

      it "returns a 404 response" do
        response = Rack::Response[*service.call(env)]

        expect(response.status).to(eq(404))
      end

      it "returns a bad route error" do
        response = Rack::Response[*service.call(env)]
        error = Twirbet::Error.from_json(response.body.first)

        expect(error).to(be_a(Twirbet::BadRouteError))
      end

      it "returns expected error message" do
        response = Rack::Response[*service.call(env)]
        error = Twirbet::Error.from_json(response.body.first)

        expect(error.message).to(eq("Unsupported content type: text/plain."))
      end
    end

    context "when the request is not a valid protocol buffer" do
      let(:env) do
        Rack::MockRequest.env_for(
          "/ping.PingService/Ping",
          method: "POST",
          input: "not a protobuf",
          "CONTENT_TYPE" => "application/protobuf",
        )
      end

      it "returns a 400 response" do
        response = Rack::Response[*service.call(env)]

        expect(response.status).to(eq(400))
      end

      it "returns a malformed error" do
        response = Rack::Response[*service.call(env)]
        error = Twirbet::Error.from_json(response.body.first)

        expect(error).to(be_a(Twirbet::MalformedError))
      end
    end

    context "when the request content type is application/json" do
      let(:env) do
        Rack::MockRequest.env_for(
          "/ping.PingService/Ping",
          method: "POST",
          input: '{"message": "Pong!"}',
          "CONTENT_TYPE" => "application/json",
        )
      end

      it "returns a 200 response" do
        response = Rack::Response[*service.call(env)]

        expect(response.status).to(eq(200))
      end

      it "returns a json content type" do
        response = Rack::Response[*service.call(env)]

        expect(response.headers["Content-Type"]).to(eq("application/json"))
      end

      it "returns a json response body" do
        response = Rack::Response[*service.call(env)]

        expect(JSON.parse(response.body.first)).to(eq("message" => "Pong!"))
      end
    end
  end
end
