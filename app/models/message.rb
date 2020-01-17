class Message < ApplicationRecord
  belongs_to :user
  belongs_to :rcable
  after_create_commit { MessageBroadcastJob.perform_later(self) }

  validates :content, presence: { message: '메시지 창이 비어 있습니다.'}

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
