class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @cities = City.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new

  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    #get city
    if !City.where(city: params[:city]).blank?
      @city = City.where(city: params[:city]).first
    else
      @city = City.create(city: params[:city])
    end
    puts "hello"
    puts params[:item][:price].first
    puts params[:date]
    @item = Item.new(title: params[:title],
                     description: params[:description],
                     city_id: @city.id,
                     price: params[:item][:price],
                     date: DateTime.parse(params[:date].first))
    if @item.save # essaie de sauvegarder en base @gossip
      redirect_to :controller => 'items', :action => 'show', id: @item.id, notice: 'Item was successfully added.'
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      flash.now[:danger] = "Error with the workshop creation"
      render :action => 'new'
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    redirect_to request.referrer, notice: 'Item was successfully destroyed.'
  end

  def search
    @items = Item.all
    if Item.exists?(title: params[:search])
      @item = Item.find_by(title: params[:search])
      flash[:success] = "Atelier found !"
      redirect_to @item
    else
      flash[:danger] = "Atelier doesn't exist !"
      render :controller => 'items', :action => 'index'
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.fetch(:item, {})
  end
end
