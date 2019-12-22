class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    ActionCable.server.broadcast "rcable_#{message.rcable.id}_channel", message: render_message(message)
  end

  private

  def render_message(message)
    MessagesController.render partial: 'messages/message', locals: { message: message }
  end
end
