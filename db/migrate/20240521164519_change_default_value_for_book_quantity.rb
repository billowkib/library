class ChangeDefaultValueForBookQuantity < ActiveRecord::Migration[7.1]
  def change
    change_column :books, :quantity, :integer, default: 0
  end
end
