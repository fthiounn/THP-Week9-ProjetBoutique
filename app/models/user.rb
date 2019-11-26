class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  after_create :welcome_send

  has_one :cart

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true

  has_one_attached :avatar

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
