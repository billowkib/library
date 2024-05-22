class Librarian < User
  self.inheritance_column = 'role'

  before_create do
    self.role = :Librarian
  end

  def return_book!(member, book)
    BookBorrow.find_by(user: member, book: book).destroy

    book.update(quantity: book.quantity + 1)
  end
end
