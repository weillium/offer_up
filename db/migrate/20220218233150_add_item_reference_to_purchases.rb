class AddItemReferenceToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :purchases, :items
    add_index :purchases, :item_id
    change_column_null :purchases, :item_id, false
  end
end
