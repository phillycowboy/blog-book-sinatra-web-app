class BlogsController < ApplicationController

    # CREATE 
        # New
        # make a get request to '/blogs/new'
        get '/blogs/new' do 
           erb :'/blogs/new' 
        end

        # Create
        # make a post request to '/blogs'
        post '/blogs' do 
            blog = Blog.new(params)
            if !blog.title.empty? && !blog.author.empty? 
                blog.save 
                redirect '/blogs'
            else
                @error = "Oops! Please fill out all of the available forms."
                erb :'/blogs/new' 
            end
        end

    # READ 
     # index - list all blogs
     # make a get request to '/blogs'
     get '/blogs' do 
        @blogs = Blog.all.reverse
        erb :'blogs/index'
     end
    
     # show - list a single blog
     # make a get request to '/blogs/:id

     get '/blogs/:id' do 
        @blog = Blog.find(params[:id])
        erb :'blogs/show'
     end
   
    # UPDATE

        # Edit
            # making a get request to '/blogs/:id/edit'
        get '/blogs/:id/edit' do 
            @blog = Blog.find(params[:id])
            erb :'/blogs/edit'
        end
        
        # Update
            #make a patch request to '/blogs/:id' 

    #DELETE 
        # make a delete request to '/blogs/:id' 

end