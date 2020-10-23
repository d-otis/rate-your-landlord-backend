class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties, id: :uuid do |t|
      t.string :address
      t.float :rating
      t.uuid :landlord_id

      t.timestamps
    end
  end
end
