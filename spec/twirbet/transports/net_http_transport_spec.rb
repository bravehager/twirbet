# typed: false
# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Twirbet::Transports::NetHTTPTransport) do
  let(:transport) { described_class.new }
  let(:request) { Twirbet::Transport::Request.new("http://example.com", "", {}) }

  before do
    stub_request(:post, "http://example.com").to_return(status: 200, body: "", headers: {})
  end

  it "returns expected status code" do
    response = transport.call(request)

    expect(response.status).to(eq(200))
  end

  it "returns expected headers" do
    response = transport.call(request)

    expect(response.headers).to(eq({}))
  end

  it "returns expected body" do
    response = transport.call(request)

    expect(response.body).to(eq(""))
  end
end
