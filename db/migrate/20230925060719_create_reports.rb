class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.references :reporter, null: false, foreign_key: { to_table: :users } 
      t.references :reported, null: false, foreign_key: { to_table: :users } 
      t.references :context, polymorphic: true, null: false
      t.string :reason, comment:'通報理由'

      t.timestamps
    end
  end
end
