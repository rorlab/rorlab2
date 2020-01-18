class User < ApplicationRecord
  rolify
  has_many :rcables, dependent: :destroy
  has_many :messages, dependent: :destroy
  NAME_REGEX = /\w+/

  validates :username, presence: true, 
                       uniqueness: { case_sensitive: false },
                       format: { with: /\A#{NAME_REGEX}\z/i },
                       length: { maximum: 15 }

  after_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  def assign_default_role
    add_role(:newuser) if roles.blank?
  end

  def name
    username || email.split('@')[0]
  end
end
