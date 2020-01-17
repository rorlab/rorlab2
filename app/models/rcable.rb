class Rcable < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  has_one_attached :cover

end