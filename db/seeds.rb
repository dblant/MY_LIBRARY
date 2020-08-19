users = [
  {username: 'Mr.Bojangles', password_digest: 'demjangles'},
  {username: 'Jane Doe', password_digest: 'buckstopshere'}, 
  {username: 'The Juice', password_digest: 'isotoner'}
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