class Member < User
  self.inheritance_column = 'role'

  before_create do
    self.role = :Member
  end

  def borrow!(book)
    return unless book.quantity.positive?

    BookBorrow.create(book: book, user: self, due_date: 12.days.from_now)
  end

  def return(book)
    
  end
end
  
