class UserMailer < ApplicationMailer
  default from: 'lafabriquedescastors@gmail.com'


  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def order_confirmation_email(user, order)
    @user = user 
    @order = order
    @items = CartItem.where(user_id: @cart.user_id)
    @url = 'http://monsite.fr/orderconfirmation'
    mail(to: @user.mail, subject: 'Confirmation de commande')
    copy_order_admin(@user, @order, @items)
  end
  


  def copy_order_admin (user, order, items)
    @user = user
    @order = order
    @items = items
    mail(to: "lafabriquedescastors@gmail.com", subject: 'Vous avez une nouvelle commande !')
  end
end
