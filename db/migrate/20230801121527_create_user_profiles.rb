class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.string :name, comment:'名前/ニックネーム'
      t.integer :user_id

      t.timestamps
    end
  end
end
