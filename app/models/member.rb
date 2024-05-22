class Member < User
  self.inheritance_column = 'role'

  before_create do
    self.role = :Member
  end

  def borrow!(book)
    return unless book.quantity.positive?

    ActiveRecord::Base.transaction do
      book.update!(quantity: book.quantity - 1)
      BookBorrow.create!(book: book, user: self, due_date: 12.days.from_now)
    end
  end

  def borrowed_books
    Book.joins(:book_borrows).where(book_borrows: { user: self })
  end

  def can_borrow?(book)
    !borrowed_books.where(id: book.id).any?
  end
end
  
