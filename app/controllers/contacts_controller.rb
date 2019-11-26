class ContactsController < ApplicationController

  def new
  end
 
  def create
    puts "pqrqms below"
    puts params[:contact]
    @contact = Contact.new(contacts_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to items_path, notice: 'message was successfully send.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def contacts_params
    params.require(:contact).permit(:first_name, :last_name, :email, :message)
  end

end
