class ContactMailer < ApplicationMailer
  default from: 'fabriquedescastors@gmail.com'
 
  def contact_form(contact)
    @contact = contact
    @to = "fabriquedescastors@gmail.com"
 
    mail(to: @to, subject: "Nouveau contact depuis le site") 
  end
 
end
