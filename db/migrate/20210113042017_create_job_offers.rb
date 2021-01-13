class CreateJobOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :job_offers do |t|
      t.integer :genre_id
      t.string :image_id
      t.string :title
      t.text :explanation
      t.text :reward
      t.boolean :is_valid
      t.integer :farmer_id

      t.timestamps
    end
  end
end
