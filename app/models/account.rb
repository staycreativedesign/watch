# == Schema Information
#
# Table name: accounts
#
#  id                 :bigint           not null, primary key
#  confirmation_token :string(128)
#  email              :string           not null
#  encrypted_password :string(128)      not null
#  first_name         :string
#  last_name          :string
#  remember_token     :string(128)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  company_id         :bigint
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
end
