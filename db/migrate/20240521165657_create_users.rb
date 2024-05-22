class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.integer :role
      t.string :email
      t.string :password_digest
      t.string :username

      t.timestamps
    end
  end
end
