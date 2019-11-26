class ContactsController < ApplicationController

  def new
  end
 
  def create
    @contact = Contact.new(params[:contact])
  end

end
