class Contact < ApplicationRecord

  attr_accessor :first_name, :last_name, :email, :message
 
  validates :last_name, :first_name, :email, :message, presence: true
  validates :email, :format => { :with => %r{.+@.+\..+} }, allow_blank: true

after_create :contact_form

  def contact_form
    ContactMailer.contact_form(self).deliver_now
  end
	 
end
