class AddCountryToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :country, :string
  end
end
