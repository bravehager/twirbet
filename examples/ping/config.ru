# typed: true
# frozen_string_literal: true

require_relative "config/application"

application = Application.new

T.unsafe(self).run Ping::PingService::Service.new(application)
