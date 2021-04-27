channel = RabbitMQ.consumer_channel
exchange = channel.default_exchange
queue = channel.queue('auth', durable: true)


queue.subscribe(manual_ack: true) do |delivery_info, properties, payload|
  payload = JSON(payload)

  uuid = Auth.extracted_token(payload['token'])['uuid']
  result = Auth::FetchUserService.call(uuid)

  exchange.publish(
    { user_id: result.user.id }.to_json,
    routing_key: properties.reply_to,
    correlation_id: properties.correlation_id
  )
end
