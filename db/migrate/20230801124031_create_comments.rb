class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :post_id, null: false, foreign_key: true
      t.string :content, comment:'思ったこと'

      t.timestamps
    end
  end
end
