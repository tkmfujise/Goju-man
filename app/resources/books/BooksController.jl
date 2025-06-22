module BooksController


struct Book
  title::String
  author::String
end


const Books = Book[
  Book("1st", "First"),
  Book("2nd", "Second"),
  Book("3rd", "Third"),
]


function books()
  "
  <h1>Books</h1>
  <ul>
    $(["<li>$(book.title) by $(book.author)</li>"
      for book in Books]...)
  </ul>
  "
end

end
