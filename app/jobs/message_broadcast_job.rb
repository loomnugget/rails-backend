class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chat_channel", message: render_message(message)
  end

  private

  def render_message(message)
    render json: { message: message }
  end
end
