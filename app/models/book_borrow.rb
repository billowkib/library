class BookBorrow < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :book, uniqueness: { scope: :user }
  scope :overdue, -> { where('due_date < ?', Time.current) }
  scope :due_today, -> { where(due_date: (Time.current.midnight - 1.day)..Time.current.midnight) }

  

  def due_today
    joins(:book_borrows).where(book_borrows: { due_date: (Time.current.midnight - 1.day)..Time.current.midnight })
  end  
end
