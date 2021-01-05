class BlogsController < ApplicationController

    # CREATE 
        # New
        # make a get request to '/blogs/new'
        get '/blogs/new' do 
            if logged_in?
                erb :'/blogs/new'
            else 
                redirect '/login'
            end 
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
        if logged_in?
            @blogs = Blog.all.reverse
            erb :'blogs/index'
        else
            redirect '/login'
        end
     end
    
     # show - list a single blog
     # make a get request to '/blogs/:id

     get '/blogs/:id' do 
        if logged_in?
            @blog = Blog.find(params[:id])
            erb :'blogs/show'
        else
            redirect '/login'
        end
     end
   
    # UPDATE

        # Edit
            # making a get request to '/blogs/:id/edit'
        get '/blogs/:id/edit' do 
            if logged_in?
                @blog = Blog.find(params[:id])
                erb :'/blogs/edit'
            else
                redirect '/login'
            end
        end
        
        # Update
            #make a patch request to '/blogs/:id' 
        patch '/blogs/:id' do 
            
            @blog = Blog.find(params[:id])
            if !params["blog"]["title"].empty? && !params["blog"]["author"].empty? 
            @blog.update(params["blog"])
             redirect "/blogs/#{params[:id]}"
            else
                @error = "Oops! Please fill out all of the available forms."
                erb :'/blogs/new' 
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