class BooksController < ApplicationController
    
    
    get '/books' do
        if logged_in?
        
          @user = current_user
          
          @books = @user.books.all
          erb :'user/user_home'
        else
          erb :log_in
        end
        
        
      end
    
      get '/new_book' do
        erb :"/book/new_book"
      end

      post '/new_book' do
        @book = current_user.books.create(params) 
        redirect to '/books'
      end

      get '/books/:id/edit' do
        @book = Book.find_by_id(params[:id])
        
        if @book.user == current_user
            erb :'book/edit'
        else
            redirect '/books'
        end
    end

    patch '/books/:id' do
      @book = Book.find_by_id(params[:id])
      if @book.user == current_user 
          if @book.update(title: params[:title], author: params[:author], genre: params[:genre]) 
              redirect '/books'
          else
              erb :'book/edit'
          end
      else
          redirect '/books'
      end
  end


  delete '/books/:id' do
    @book = Book.find_by_id(params[:id])
    if @book.user == current_user
        @book.delete
    end
    redirect '/books'
end
    


end