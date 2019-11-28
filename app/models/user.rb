class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  has_one_attached :avatar
  after_create :welcome_send
  after_create :creation_cart

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
 
end
