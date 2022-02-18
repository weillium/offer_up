class AddUserReferenceToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :purchases, :users
    add_index :purchases, :user_id
    change_column_null :purchases, :user_id, false
  end
end
