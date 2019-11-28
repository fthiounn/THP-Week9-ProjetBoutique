class Admin::UsersController < ApplicationController
  before_action :set_user
  def index
    @users = User.all
    render :layout => 'admin_users_layouts'
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(first_name: params[:first_name], 
                    last_name: params[:last_name],
                    description: params[:description],
                    email: params[:mail])
    
    if params[:password] != params[:confirmpassword]
      flash.now[:danger] = "Passwords must match !"
      render :action => 'new' 
    end
    if @user.save # essaie de sauvegarder en base @gossip
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        flash[:success] = "You successfuly created your account"
        redirect_to :controller => 'users', :action => 'index'
    else
      format.html { render :new }
      format.json { render json: @user.errors, status: :unprocessable_entity }
      flash.now[:danger] = "Error with the account creation"
      render :action => 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @user.avatar.purge
    @user.avatar.attach(params[:avatar])
    user_params = params.require(:user).permit(:first_name, :last_name, :description, :avatar)
      if @user.update(user_params)
        flash[:success] = "You successfuly updated your account"
        redirect_to @user
      else
        render :action => 'edit'
      end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end
end
