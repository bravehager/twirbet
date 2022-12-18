# typed: ignore
# frozen_string_literal: true

require "google/protobuf"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("proto/ping.proto", syntax: :proto3) do
    add_message "ping.PingRequest" do
      optional :message, :string, 1
    end
    add_message "ping.PingResponse" do
      optional :message, :string, 1
    end
  end
end

module Ping
  PingRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("ping.PingRequest").msgclass
  PingResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("ping.PingResponse").msgclass
end
