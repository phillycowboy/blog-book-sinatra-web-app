class ChangeBlogsGenresToGenresBlogs < ActiveRecord::Migration
  def change
    drop_table :blogs_genres 
    create_join_table :genres, :blogs do |t|
      t.integer :genre_id 
      t.integer :blog_id 
    
    end

  end
end
