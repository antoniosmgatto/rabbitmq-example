#!/usr/bin/env ruby

require "bunny"

host = ENV.fetch("RABBITMQ_HOST", "localhost")
port = ENV.fetch("RABBITMQ_PORT", 5672)

connection = Bunny.new(host:, port:)
connection.start

channel = connection.create_channel

queue = channel.queue("hello")

begin
    puts ' [*] Waiting for messages. To exit press CTRL+C'
    queue.subscribe(block: true) do |_delivery_info, _properties, body|
        puts " [x] Received #{body}"
    end
rescue Interrupt => _
    connection.close

    exit(0)
end