users = [
  {username: 'Mr.Bojangles', password: 'demjangles'},
  {username: 'Jane Doe', password: 'buckstopshere'}, 
  {username: 'The Juice', password: 'isotoner'}
]

users.each do |u|
  User.create(u)
end

books = [ {title: "The Dome", author: "Stephen King", genre: "Horror"}, 
{title: "Harry Potter and the Sorcerer's Stone", author: "J.K. Rowling", genre: "Fantasy"},
{title: "There and Back Again", author: "Bilbo Baggins", genre: "Adventure"}

]

books.each do |u|
    Book.create(u)
  end