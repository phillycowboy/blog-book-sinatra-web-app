require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions 
    set :session_secret, "whatever"
    set :public_folder, 'public'
    set :views, 'app/views'
    # rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  end

  not_found do 
    status 404
    erb :error
  end


  get "/" do
    erb :welcome
  end
 
  def logged_in? 
    !!current_user
  end


  def current_user
   @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_login
    unless logged_in?
      redirect '/login'
    end

  end



  # def record_not_found 
  #   render text: "404 not found!", status: 404
  #   erb :error
  # end


 

end
