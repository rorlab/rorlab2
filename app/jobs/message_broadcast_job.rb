class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    RcableChannel.broadcast_to message.rcable, message: render_message(message)
  end

  private

  def render_message(message)
    MessagesController.render message
  end
end
