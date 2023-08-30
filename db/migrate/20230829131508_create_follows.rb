class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.integer :follower_id, class_name:"User"
      t.integer :followed_id, class_name:"User"

      t.timestamps
    end
  end
end
