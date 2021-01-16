class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :title
      t.string :image_id
      t.text :explanation
      t.integer :user_id
      t.integer :farmer_id
      t.float :rate

      t.timestamps
    end
  end
end
