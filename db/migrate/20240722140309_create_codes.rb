class CreateCodes < ActiveRecord::Migration[7.1]
  def change
    create_table :codes do |t|
      t.string :confirmation_token, limit: 128, null: false
      t.string :ip
      t.timestamps
    end
  end
end
