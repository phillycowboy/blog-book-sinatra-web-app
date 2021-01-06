class Blog < ActiveRecord::Base 
    validates_presence_of :title, :author, :content
    belongs_to :user 
end 