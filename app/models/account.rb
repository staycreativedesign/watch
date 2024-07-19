# == Schema Information
#
# Table name: accounts
#
#  id                           :bigint           not null, primary key
#  confirmation_token           :string(128)
#  confirmed_at                 :datetime
#  email                        :string           not null
#  encrypted_password           :string(128)      not null
#  first_name                   :string
#  invitation_code              :string
#  invitation_code_confirmed_at :datetime
#  last_name                    :string
#  remember_token               :string(128)      not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  company_id                   :bigint
#
# Indexes
#
#  index_accounts_on_company_id          (company_id)
#  index_accounts_on_confirmation_token  (confirmation_token) UNIQUE
#  index_accounts_on_email               (email)
#  index_accounts_on_remember_token      (remember_token) UNIQUE
#

class Account < ApplicationRecord
  include Clearance::User
  belongs_to :company, optional: true
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validate :check_invitation_code, on: :create

  def check_invitation_code
    return if invitation_code == '111'

    errors.add :invitation_code, 'Your invitation code is incorrect or has been used already.'
  end
end
