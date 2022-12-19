# typed: true
# frozen_string_literal: true

require "net/http"
require "twirbet/transport"

module Twirbet
  module Transports
    class NetHTTPTransport
      extend T::Sig
      include Transport

      sig { override.params(request: Transport::Request).returns(Transport::Response) }
      def call(request)
        response = T.cast(Net::HTTP.post(URI(request.url), request.body, request.headers), Net::HTTPResponse)
        Transport::Response.new(response.code.to_i, response.to_hash, response.body)
      end
    end
  end
end
