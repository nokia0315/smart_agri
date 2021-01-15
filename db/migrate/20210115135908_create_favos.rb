class CreateFavos < ActiveRecord::Migration[5.2]
  def change
    create_table :favos do |t|
      t.integer :user_id
      t.integer :job_offer_id

      t.timestamps
    end
  end
end
