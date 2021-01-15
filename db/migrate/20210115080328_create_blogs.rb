class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.text :title
      t.string :image_id
      t.text :explanation
      t.integer :farmer_id

      t.timestamps
    end
  end
end
