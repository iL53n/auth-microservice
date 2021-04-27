module RabbitMQ
  extend self

  def connection
    @connection ||= Bunny.new.start
  end

  def channel
    connection.create_channel
  end

  def consumer_channel
    connection.create_channel(
      nil,
      Settings.rabbitmq.consumer_pool
    )
  end
end
