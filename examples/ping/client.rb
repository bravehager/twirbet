require_relative "proto/ping_twirbet"

client = Ping::PingService::Client.new("http://localhost:8080")

time_start = Time.now

response = client.ping(Ping::PingRequest.new(message: "Hello, world!"))

time_finish = Time.now

puts "Response: #{response.inspect}"
puts "Time elapsed: #{((time_finish - time_start) * 1000).round(2)}ms"
