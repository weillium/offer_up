class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :image
      t.float :price
      t.integer :category_id
      t.text :description
      t.integer :user_id
      t.string :location_url

      t.timestamps
    end
  end
end
