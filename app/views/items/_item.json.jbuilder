json.extract! item, :id, :title, :image, :price, :category_id, :description,
              :user_id, :location_url, :created_at, :updated_at
json.url item_url(item, format: :json)
