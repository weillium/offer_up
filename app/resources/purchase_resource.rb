class PurchaseResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :item_id, :integer
  attribute :user_id, :integer

  # Direct associations

  # Indirect associations

end
