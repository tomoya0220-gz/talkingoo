class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
  
      t.timestamps
    end
    Category.create(name:"仕事")
    Category.create(name:"人間関係")
    Category.create(name:"趣味")
    Category.create(name:"勉強・資格")
    Category.create(name:"日常生活")
    Category.create(name:"生き方")
    Category.create(name:"恋愛")
  end

  
end
