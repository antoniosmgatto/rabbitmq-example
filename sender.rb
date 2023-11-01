#!/usr/bin/env ruby

require "bunny"

host = ENV.fetch("RABBITMQ_HOST", "localhost")
port = ENV.fetch("RABBITMQ_PORT", 5672)

connection = Bunny.new(host:, port:)
connection.start

channel = connection.create_channel

queue = channel.queue("hello")

channel.default_exchange.publish("Hello World!", routing_key: queue.name)

puts " [x] Sent 'Hello World!'"

connection.close