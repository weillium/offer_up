class AddLocationUrlLongitudeToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :location_url_longitude, :float
  end
end
