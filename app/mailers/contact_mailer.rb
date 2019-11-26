class ContactMailer < ApplicationMailer
  default from: 'lafabriquedescastors@gmail.com'
 
  def contact_form(contact)
    @contact = contact
 
    mail(to: "fabriquedescastors@gmail.com", subject: "Nouveau contact depuis le site") 
  end
 
end
