class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast("ChatChannel", { id: message.id, content: message.content, user_id: message.user_id })
  end

end
