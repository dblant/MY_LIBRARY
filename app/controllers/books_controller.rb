class BooksController < ApplicationController
    
    
    get '/books' do
        # if logged_in?
        binding.pry
          @user = current_user
          # binding.pry
          @books = @user.books.all
          erb :'user/user_home'
        # else
        #   erb :log_in
        # end
        
        
      end
    
      get '/new_book' do
        erb :"/book/new_book"
      end

      post '/new_book' do
        # binding.pry
        @book = current_user.books.create(params) 
        # binding.pry
        redirect to '/books'
      end


end