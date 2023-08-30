class AddIntroductionToUserProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :user_profiles, :introduction, :string
  end
end
