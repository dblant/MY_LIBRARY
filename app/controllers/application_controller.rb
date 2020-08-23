require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret" 
  end

  get "/" do
    
    # @user = User.find_by_id(params[:id])
    erb :home
  end

  # get '/user/login' do
  #   erb :log_in
  # end

  # get '/user/:id' do
  #   if logged_in?
  #     @user = User.find_by_id(params[:id])
  #     @books = @user.books.all
  #     erb :"user/user_home"
  #   else
  #     erb :log_in
  #   end
    
    
  # end

  # get '/sign_up' do
  #   erb :sign_up
  # end

  
 
#   post '/user/login' do
#     @user = User.find_by(username: params[:username])
#     if @user && @user.authenticate(params[:password])
#       session[:user_id] = @user.id
      
#       binding.pry
#     redirect to "/user/#{@user.id}"
#     else
#     erb :log_in
#     end
#   end

# post '/sign_up' do
#     @new_user = User.create(username: params[:username], password: params[:password])
#     @new_user.save
#     session[:user_id] = @new_user.id
#     redirect to "user/#{@new_user.id}"
#   end


# # get '/new_book' do


# #     erb :"/book/new_book"
# #   end

#   # post '/new_book' do
#   #   # binding.pry
#   #   @book = current_user.books.build(params) 
#   #   # binding.pry
#   #   redirect to '/user/:id'
#   # end

#   get '/logout' do
#     session.clear
#     redirect to "/"
#   end


  helpers do
 
 
 
    def logged_in?
      !!current_user
    end



    def current_user
      # uses memoization to prevent duplicate database queries
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

   

  end
end
