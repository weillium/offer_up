class AddLocationUrlLatitudeToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :location_url_latitude, :float
  end
end
