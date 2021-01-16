class AddIntroductionToFarmers < ActiveRecord::Migration[5.2]
  def change
    add_column :farmers, :introduction, :text
  end
end
