class AddImageIdToFarmers < ActiveRecord::Migration[5.2]
  def change
    add_column :farmers, :image_id, :string
  end
end
