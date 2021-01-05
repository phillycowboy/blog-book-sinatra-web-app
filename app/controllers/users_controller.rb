class UsersController < ApplicationController

# Users can sign up 
get '/signup' do 
    erb :'users/signup'
end

post '/signup' do 
    # users should not be able to create an account with any blank credentials 
    # users should not be able to create an account with a username that already exists 
    user = User.new(params)
    if user.username.empty?  || user.password.empty?
        @error = "Username and Password can't be blank" 
        erb :'users/signup'
    elsif User.find_by(username: user.username)
        @error = "That username is already active, please try another."
         erb :'users/signup'
    else 
        user.save
        session[:user_id] = user.id
        redirect '/blogs'
    end
end


# Users can delete account 


end