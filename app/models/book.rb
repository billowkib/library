class Book < ApplicationRecord
  has_many :book_borrows
  validates :title, :author, :isbn, :genre, presence: true

  class << self
    def borrowed
      where.associated(:book_borrows).distinct
    end
  end
end
