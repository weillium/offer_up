class Api::V1::PurchasesController < Api::V1::GraphitiController
  def index
    purchases = PurchaseResource.all(params)
    respond_with(purchases)
  end

  def show
    purchase = PurchaseResource.find(params)
    respond_with(purchase)
  end

  def create
    purchase = PurchaseResource.build(params)

    if purchase.save
      render jsonapi: purchase, status: 201
    else
      render jsonapi_errors: purchase
    end
  end

  def update
    purchase = PurchaseResource.find(params)

    if purchase.update_attributes
      render jsonapi: purchase
    else
      render jsonapi_errors: purchase
    end
  end

  def destroy
    purchase = PurchaseResource.find(params)

    if purchase.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: purchase
    end
  end
end
