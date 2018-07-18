class ChatChannel < ApplicationCable::Channel
  # Called when the consumer has successfully
  # become a subscriber to this channel.
  def subscribed
    stream_from "ChatChannel"
  end

  def unsubscribed
    stop_all_streams
  end

  def received(data)
    p "RECEIVE"
   ActionCable.server.broadcast \
     "ChatChannel", format_response(data)
 end

  def send_message(data)
    p "SEND MESSAGE"
    message = data['body']
    # Message.create(content: data['message'])
    ActionCable.server.broadcast "ChatChannel", { message: message }
  end
end
