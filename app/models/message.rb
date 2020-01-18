class Message < ApplicationRecord
  belongs_to :user
  belongs_to :rcable

  has_one_attached :image
  
  after_create_commit { MessageBroadcastJob.perform_later(self) }

  validates :content, presence: { message: '메시지 창이 비어 있습니다.'}

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end

  def mentions
    content.scan(/@(#{User::NAME_REGEX})/).flatten.map do |username|
      User.find_by(username: username)
    end.compact
  end
end
