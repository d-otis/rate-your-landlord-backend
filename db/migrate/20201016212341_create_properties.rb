class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties, id: :uuid do |t|
      t.string :address
      t.uuid :landlord_id
      t.float :rating

      t.timestamps
    end
  end
end
