class Message < ApplicationRecord
  belongs_to :user
  belongs_to :rcable
  after_create_commit { MessageBroadcastJob.perform_later(self) }

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
