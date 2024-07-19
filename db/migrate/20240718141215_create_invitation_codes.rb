class CreateInvitationCodes < ActiveRecord::Migration[7.1]
  def change
    create_table :invitation_codes do |t|
      t.string :code
      t.timestamps
    end
  end
end
