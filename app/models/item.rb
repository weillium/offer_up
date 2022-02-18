class Item < ApplicationRecord
  # Direct associations

  belongs_to :category

  has_many   :purchases,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    title
  end

end