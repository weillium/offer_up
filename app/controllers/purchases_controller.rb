class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[show edit update destroy]

  def index
    @q = Purchase.ransack(params[:q])
    @purchases = @q.result(distinct: true).includes(:user,
                                                    :item).page(params[:page]).per(10)
  end

  def show; end

  def new
    @purchase = Purchase.new
  end

  def edit; end

  def create
    @purchase = Purchase.new(purchase_params)

    if @purchase.save
      message = "Purchase was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @purchase, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @purchase.update(purchase_params)
      redirect_to @purchase, notice: "Purchase was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @purchase.destroy
    message = "Purchase was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to purchases_url, notice: message
    end
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:item_id, :user_id)
  end
end
