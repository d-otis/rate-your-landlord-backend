class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews, id: :uuid do |t|
      t.text :content
      t.uuid :property_id
      t.integer :rating

      t.timestamps
    end
  end
end
