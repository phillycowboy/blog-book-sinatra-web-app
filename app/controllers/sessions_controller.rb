class SessionsController < ApplicationController

# users can log in 
get '/login' do 
    erb :'users/login'
end 

# users can log out

post '/login' do 
    if params["username"].empty?  || params["password"].empty?
        @error = "Username and Password can't be blank" 
        erb :'users/login'      
    else 
        if user = User.find_by(username: params["username"], password: params["password"])
              session[:user_id] = user.id
               redirect '/blogs'
        else
            @error = "Account not found"
            erb :'users/login'
        end
    end
end



end