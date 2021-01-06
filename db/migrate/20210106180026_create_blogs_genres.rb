class CreateBlogsGenres < ActiveRecord::Migration
  def change
    create_table :blogs_genres do |t|
      t.integer :blog_id 
      t.integer :genre_id 
    end
  end
end
