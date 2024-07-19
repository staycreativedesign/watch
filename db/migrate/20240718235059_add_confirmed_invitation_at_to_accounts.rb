class AddConfirmedInvitationAtToAccounts < ActiveRecord::Migration[7.1]
  def change
    add_column :accounts, :invitation_code_confirmed_at, :datetime
  end
end
