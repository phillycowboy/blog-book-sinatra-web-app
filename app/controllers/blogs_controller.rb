class BlogsController < ApplicationController

    # CREATE 
        # New
        # make a get request to '/blogs/new'

        # Create
        # make a post request to '/blogs'

    # READ 
     # index - list all blogs
     # make a get request to '/blogs'
     get '/blogs' do 
        @blogs = Blog.all 
        erb :'blogs/index'
     end
    
     # show - list a single blog
     # make a get request to '/blogs/:id
   
    # UPDATE

        # Edit
            # making a get request to '/blogs/:id/edit'
        
        # Update
            #make a patch request to '/blogs/:id' 

    #DELETE 
        # make a delete request to '/blogs/:id' 

end