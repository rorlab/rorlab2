class User < ApplicationRecord
  rolify
  has_many :messages, dependent: :destroy

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
    email.split('@')[0]
  end
end
