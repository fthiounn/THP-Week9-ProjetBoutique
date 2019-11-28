class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :edit, :update]
  before_action :is_owner, only: [:show, :edit, :update]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @orderItems = OrderItem.where(order_id: @order.id)
  end

  # GET /orders/new
  def new
    create
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    # creer un order
    @order = Order.create(user_id: current_user.id)
    @cart_id = Cart.where(user_id: current_user.id).first.id
    @item = Item.where(id: CartItem.select(:item_id).where(cart_id: @cart_id))
    # qjouter tous les items du cqrt dqns OrderItems
    @item.each do |item|
      qte = CartItem.where(cart_id: @cart_id, item_id: item.id).first.quantity
      OrderItem.create(order_id: @order.id, item_id: item.id, quantity: qte)
    end
    # vider le cart
    CartItem.where(cart_id: @cart_id).destroy_all

    redirect_to order_path(@order)
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.fetch(:order, {})
  end

  def is_owner
    if current_user.id != @order.user_id
      flash[:danger] = "Ceci n'est pas ta commande !"
      redirect_to "/"
    end
  end
end