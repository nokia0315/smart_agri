class AddImageIdToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :image_id, :string
  end
end
