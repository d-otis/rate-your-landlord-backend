class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews, id: :uuid do |t|
      t.text :content
      t.integer :rating
      t.uuid :property_id

      t.timestamps
    end
  end
end
