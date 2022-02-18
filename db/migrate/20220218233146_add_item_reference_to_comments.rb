class AddItemReferenceToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :items
    add_index :comments, :item_id
    change_column_null :comments, :item_id, false
  end
end
