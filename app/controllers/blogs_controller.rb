class BlogsController < ApplicationController

    before do 
        require_login
    end


    get '/blogs/new' do 
        @genres = Genre.all 
        erb :'/blogs/new'
    end

       
    post '/blogs' do 
     blog = current_user.blogs.build(params["blog"])
        if genre = Genre.find_by(name: params["genre"]["name"])
            blog.genres << genre 
        else
            blog.genres.build(params["genre"])
            end
        if  blog.save 
            redirect '/blogs'
        else
            @error = "Oops! Please fill out all of the available forms."
            erb :'/blogs/new' 
        end
    end

    
     get '/blogs' do 
        @blogs = Blog.all.reverse
        erb :'blogs/index'
     end
    

     get '/blogs/:id' do 
        @blog = Blog.find_by(id: params[:id])
        if !@blog 
          erb :'error'
        else @blog
            erb :'blogs/show'
        # else 
        #   redirect '/blogs'
        end
       
     end
   


    get '/blogs/:id/edit' do 
     @blog = Blog.find_by(id: params[:id])
        unless current_user 
            erb :'/blogs/edit'
        end
        if !@blog && !current_user
            erb :'error'
        elsif  @blog && @blog.user == current_user
            erb :'/blogs/edit'
        else
            redirect '/blogs/index'
        end

    end

        
        

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

        
    delete '/blogs/:id' do 
        blog = Blog.find(params[:id])
        blog.destroy
        redirect '/blogs'
    end

    get '/genres' do 
        @genres = Genre.all
        erb :'/genres/index' 
    end

    get '/library' do 
        @blogs = current_user.blogs.reverse
        erb :'/blogs/index'
    end

    get '/longest' do 
        @blogs = Blog.all 
        @longest_blog =  @blogs.max_by{ |blog| blog.content.length} 
        erb :'blogs/longest'
    end

end