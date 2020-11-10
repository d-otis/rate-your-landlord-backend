class AddImageToProperty < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :image_url, :string
  end
end
