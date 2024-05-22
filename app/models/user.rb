class User < ApplicationRecord
  has_secure_password
  has_many :book_borrows
  has_many :books, through: :book_borrows
  enum role: %i[Librarian Member]
end
