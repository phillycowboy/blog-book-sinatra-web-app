class UsersController < ApplicationController

# Users can sign up 
get '/signup' do 
    erb :'users/signup'
end

post '/signup' do 
    # users should not be able to create an account with any blank credentials 
    # users should not be able to create an account with a username that already exists 
    user = User.new(params)
    if user.save 
        session[:user_id] = user.id
        redirect '/blogs'
    else 
        @error = "Invalid Credentials"
        erb :'/users/signup'
    end
end


# Users can delete account 


end