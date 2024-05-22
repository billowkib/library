class Book < ApplicationRecord
  has_many :book_borrows
  validates :title, :author, :isbn, :genre, presence: true

  class << self
    def borrowed
      where.associated(:book_borrows).distinct
    end

    def due_today
      joins(:book_borrows).where(book_borrows: { due_date: (Time.current.midnight - 1.day)..Time.current.midnight })
    end
  end
end
