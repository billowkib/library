class AddBorrowedBooksIndex < ActiveRecord::Migration[7.1]
  def change
    add_index :book_borrows, [:user_id, :book_id]
  end
end
