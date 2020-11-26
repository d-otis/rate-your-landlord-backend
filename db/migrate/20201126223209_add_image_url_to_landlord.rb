class AddImageUrlToLandlord < ActiveRecord::Migration[6.0]
  def change
    add_column :landlords, :image_url, :string
  end
end
