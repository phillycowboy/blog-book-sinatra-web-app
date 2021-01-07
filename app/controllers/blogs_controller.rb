class BlogsController < ApplicationController

    before do 
        require_login
    end

    # CREATE 
        # New
        # make a get request to '/blogs/new'
        get '/blogs/new' do 
            @genres = Genre.all 
            erb :'/blogs/new'
        end

        # Create
        # make a post request to '/blogs'
        post '/blogs' do 
            blog = current_user.blogs.build(params)
            if blog.save 
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
        @blog = Blog.find_by(id: params[:id])
        if @blog 
          erb :'blogs/show'
        else 
          redirect '/blogs'
        end
       
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
        patch '/blogs/:id' do 
            
            @blog = Blog.find(params[:id])
            if !params["blog"]["title"].empty? && !params["blog"]["author"].empty? && !params["blog"]["content"].empty?
            @blog.update(params["blog"])
             redirect "/blogs/#{params[:id]}"
            else
                @error = "Oops! Please fill out all of the available forms."
                erb :'/blogs/edit' 
            end
        end

    #DELETE 
        # make a delete request to '/blogs/:id' 
     delete '/blogs/:id' do 
        blog = Blog.find(params[:id])
        blog.destroy
        redirect '/blogs'
     end

end