class Comment < ApplicationRecord
  # Direct associations

  belongs_to :item

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    item.to_s
  end

end
