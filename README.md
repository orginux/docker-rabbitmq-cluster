# Cluster RabbitMQ :rabbit: with HAProxy

There are a lots of good options if you want to run a [RabbitMQ](https://hub.docker.com/_/rabbitmq/) cluster in [docker](http://docker.com/). Here's an solution that only rely on [docker official images](https://hub.docker.com/_/rabbitmq/) :tada:

The main benifit with this approach is that you can use [any version](https://hub.docker.com/r/library/rabbitmq/tags/) of RabbitMQ, which is maintaied by docker and will be up-to-date with future releases.

## Install

```bash
git clone https://github.com/orginux/docker-rabbitmq-ha-cluster.git
cd docker-rabbitmq-ha-cluster
chmod 600 erlang.cookie
docker-compose up -d
```

Most things will be how you expect:

* See the default username and password in .env file
* The broker accepts connections on `localhost:5672`
* The Management interface is found at `localhost:15672`

## HA Proxy

This `docker-compose.yml` file comes with the latest version of [HA Proxy](http://www.haproxy.org/), an open source software that provides a high availability load balancer and proxy server.

It should be fairly easy to add a [`port mapping`](https://docs.docker.com/compose/compose-file/#ports) for the individual containers if it is desired to connect to a specific broker node.
