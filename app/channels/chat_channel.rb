class ChatChannel < ApplicationCable::Channel
  # Consumers subscribe to channels, acting as subscribers. Their connection is
  # called a subscription. Produced messages are then routed to these channel
  # subscriptions based on an identifier sent by the cable consumer.

  # Called when the consumer has successfully
  # become a subscriber to this channel.
  def subscribed
    p "SUBSCRIBED"
    p "SUBSCRIBED"
    p "SUBSCRIBED"
    # current_user.appear
    # Streams provide the mechanism by which channels route published content (broadcasts) to their subscribers.
    # stream_from "chat_#{params[:room]}"
  end

  def unsubscribed
    # current_user.disappear
  end

  def appear(data)
    # current_user.appear on: data['appearing_on']
  end

  def away
    # current_user.away
  end
end
