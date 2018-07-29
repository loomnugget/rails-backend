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
  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(data)
    message = data["body"]
    message = Message.create(content: message, user_id: current_user.id)
  end
end
