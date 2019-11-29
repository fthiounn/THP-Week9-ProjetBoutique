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

  def order_confirmation_email(user_id, order)
    @user = User.find(user_id)
    @cart = Cart.where(user_id: @user.id).first
    @order = order
    @items = CartItem.where(cart_id: @cart.id)
    @url = 'http://monsite.fr/orderconfirmation'
    mail(to: @user.email, subject: 'Confirmation de commande')
  end



  def copy_order_admin (user_id, order)
    @user = User.find(user_id)
    @cart = Cart.where(user_id: @user.id).first
    @order = order
    @items = CartItem.where(cart_id: @cart.id)
    mail(to: "lafabriquedescastors@gmail.com", subject: 'Vous avez une nouvelle commande !')
  end
end
