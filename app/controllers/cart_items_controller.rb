class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /cart_items
  # GET /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1
  # GET /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
    create
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items
  # POST /cart_items.json
  def create
    @cart_id = Cart.where(user_id: current_user.id).first.id
    #CHECK if the item is alrady here
    if CartItem.where(cart_id: @cart_id,item_id: params[:item_id]).blank? then
      #if not
      CartItem.create(cart_id: @cart_id, item_id: params[:item_id], quantity: params[:quantity])
    else
      #else, add the number
      qte = CartItem.where(cart_id: @cart_id,item_id: params[:item_id]).first.quantity + params[:quantity].to_i
      CartItem.update(quantity: qte)
    end
    redirect_to cart_path(@cart_id)
  end

  # PATCH/PUT /cart_items/1
  # PATCH/PUT /cart_items/1.json
  def update
    if(params[:intent] == "quantity") then
      @qte = @cart_item.quantity + params[:value].to_i
      @cart_item.update(quantity: @qte)
    end
    @cart = Cart.find(@cart_item.cart_id)
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart = Cart.where(user_id: current_user.id).first
    @cart_item_id = @cart_item.id
    @cart_item.destroy
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_item_params
    params.fetch(:cart_item, {})
  end
end
