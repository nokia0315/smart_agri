class AddFarmerIdToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :farmer_id, :string
  end
end
