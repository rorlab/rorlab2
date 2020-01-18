class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    RcableChannel.broadcast_to message.rcable, message: render_message(message)
    message.mentions.each do |mention|
      ActionCable.server.broadcast "rcable_channel_user_#{mention.id}",
                                   mention: true
    end
  end

  private

  def render_message(message)
    MessagesController.render message
  end
end
