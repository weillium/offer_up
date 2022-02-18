json.extract! purchase, :id, :item_id, :user_id, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
