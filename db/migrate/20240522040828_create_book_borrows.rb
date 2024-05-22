class CreateBookBorrows < ActiveRecord::Migration[7.1]
  def change
    create_table :book_borrows do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :due_date
      t.timestamps
    end
  end
end
