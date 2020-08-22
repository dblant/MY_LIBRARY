require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "password_security" 
  end

  get "/" do
    @user = User.find_by_id(params[:id])
    erb :home
  end

  get '/user/login' do
    erb :log_in
  end

  get '/user/:id' do
    @user = User.find_by_id(params[:id])
    @books = @user.books.all
    # binding.pry
    erb :"user/user_home"
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/new_book' do
    erb :"/book/new_book"
  end

 
  post '/user/login' do
    user = User.find_by(username: params[:username])
    # binding.pry
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
    redirect to "/user/#{user.id}"
    else
    erb :log_in
    end
  end

  get '/logout' do
    session.clear
    redirect to "/"
  end


  post '/sign_up' do
    @new_user = User.create(username: params[:username], password: params[:password])
    redirect to "user/#{@new_user.id}"
  end






end
