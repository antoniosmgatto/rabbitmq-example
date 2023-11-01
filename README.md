# RabbitMQ example

A simple example using Bunny gem (Ruby).

## Requirements

* Docker Desktop v24+

## Steps

```bash
    # Build docker images
    docker compose build

    # Start RabbitMQ and consumer
    docker compose up rabbitmq consumer

    # Send an message
    docker compose run sender
```
