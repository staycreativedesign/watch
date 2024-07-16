class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
      t.string :first_name
      t.string :last_name
      t.belongs_to :company
    end

    add_index :accounts, :email
    add_index :accounts, :confirmation_token, unique: true
    add_index :accounts, :remember_token, unique: true
  end
end
