class UsersController < ApplicationController


get '/signup' do 
    erb :'users/signup'
end

post '/signup' do 
    user = User.new(params)
    if user.save 
        session[:user_id] = user.id
        redirect '/blogs'
    else 
        @error = "Invalid Credentials Please Try Again."
        erb :'/users/signup'
    end
end

 


end