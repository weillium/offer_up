class ItemsController < ApplicationController
  before_action :current_user_must_be_item_user, only: [:edit, :update, :destroy] 

  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(:distinct => true).includes(:user, :comments, :purchases, :category).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@items.where.not(:location_url_latitude => nil)) do |item, marker|
      marker.lat item.location_url_latitude
      marker.lng item.location_url_longitude
      marker.infowindow "<h5><a href='/items/#{item.id}'>#{item.title}</a></h5><small>#{item.location_url_formatted_address}</small>"
    end
  end

  # GET /items/1
  def show
    @purchase = Purchase.new
    @comment = Comment.new
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      message = 'Item was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @item, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    message = "Item was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to items_url, notice: message
    end
  end


  private

  def current_user_must_be_item_user
    set_item
    unless current_user == @item.user
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:title, :image, :price, :category_id, :description, :user_id, :location_url)
    end
end
