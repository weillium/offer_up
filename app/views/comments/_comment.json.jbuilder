json.extract! comment, :id, :item_id, :user_id, :comment, :created_at,
              :updated_at
json.url comment_url(comment, format: :json)
