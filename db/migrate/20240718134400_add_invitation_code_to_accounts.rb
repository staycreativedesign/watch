class AddInvitationCodeToAccounts < ActiveRecord::Migration[7.1]
  def change
    add_column :accounts, :invitation_code, :string
  end
end
