# == Schema Information
#
# Table name: companies
#
#  id              :bigint           not null, primary key
#  address1        :string
#  address2        :string
#  city            :string
#  invitation_code :string
#  name            :string
#  postal_code     :string
#  state           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Company < ApplicationRecord
  has_many :accounts
end
