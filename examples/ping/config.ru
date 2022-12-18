# typed: false
# frozen_string_literal: true

require_relative "service"

handler = PingHandler.new
service = PingService.new(handler)

run service
