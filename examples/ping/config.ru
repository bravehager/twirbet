# typed: false
# frozen_string_literal: true

require_relative "service"

handler = PingHandler.new
service = Ping::PingService::Service.new(handler)

run service
