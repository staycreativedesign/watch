class AddRegistrationCodeToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :registration_code, :string
  end
end
