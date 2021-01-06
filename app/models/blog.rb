class Blog < ActiveRecord::Base 
    validates_presence_of :title, :author, :content
    belongs_to :user 
    has_and_belongs_to_many :genres 
end     