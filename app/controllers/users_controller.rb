class UsersController < ApplicationController

    get '/sign_up' do
        erb :sign_up
    end

      post '/sign_up' do
        new_user = User.create(username: params[:username], password: params[:password])
       
        session[:user_id] = new_user.id
        redirect to '/books'
      end   

      get '/login' do
        
        erb :log_in
      end

      post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          
          binding.pry
        redirect '/books'
        else
        redirect '/login'
        end
      end

      get '/logout' do
        session.clear
        redirect to "/"
      end
    

end