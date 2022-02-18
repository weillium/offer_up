class ItemResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :title, :string
  attribute :image, :string
  attribute :price, :float
  attribute :category_id, :integer
  attribute :description, :string
  attribute :user_id, :integer
  attribute :location_url, :string

  # Direct associations

  belongs_to :user

  # Indirect associations

end
