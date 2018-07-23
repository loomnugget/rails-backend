class ChatChannel < ApplicationCable::Channel
  # Called when the consumer has successfully become a subscriber to this channel.
  # Subscribed and unsubscribed are not callable methods, as they were already declared in ActionCable::Channel::Base
  # Other defined public methods are exposed automatically to client-side invocation
  # through the @perform method on the Subscription
  # You can declare any public method on the
  # channel (optionally taking a <tt>data</tt> argument), and this method is
  # automatically exposed as callable to the client.
  # All channels get access to any identifiers defined in connection.rb (identified_by :current_user)
  # Data is transmitted to the client in this form:
  # payload = { channel_class: self.class.name, data: data, via: via }

  def subscribed
    stream_from "ChatChannel"
    # Can also stream from a model: stream_for(@messages)

    # Example broadcasting for this channel
    # ActionCable.server.broadcast "ChatChannel", author: 'test', content: 'Rails is just swell'

    # Example of rejection that will invoke the #reject callback on client side
    # @room = Chat::Room[params[:room_number]]
    # reject unless current_user.can_access?(@room)
  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(data)
    p "SEND MESSAGE: #{data}"
    message = data["body"]
    message = Message.create(content: message)
    ActionCable.server.broadcast("ChatChannel", { id: message.id, content: message.content, user_id: current_user.id })
  end
end
