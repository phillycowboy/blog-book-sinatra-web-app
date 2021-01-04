class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title 
      t.string :author 
      t.text :content
      t.integer :user_id
    end
  end
end
