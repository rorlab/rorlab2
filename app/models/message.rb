class Message < ApplicationRecord
  belongs_to :user
  belongs_to :rcable
  after_create_commit { MessageBroadcastJob.perform_later(self) }
end
