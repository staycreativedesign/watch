class RemoveInvitationCodeFromAccounts < ActiveRecord::Migration[7.1]
  def change
    remove_column :accounts, :invitation_code
  end
end
