class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :title, comment:'トーク'
      t.string :content, comment:'話したいこと'

      t.timestamps
    end
  end
end
