# typed: true

require_relative "config/environment"

client = Ping::PingService::Client.new("http://localhost:9292")

time_start = Time.now

response = client.ping(Ping::PingRequest.new(message: "Hello, world!"))

time_finish = Time.now

puts "Response: #{response.inspect}"
puts "Time elapsed: #{((time_finish - time_start) * 1000).round(2)}ms"
