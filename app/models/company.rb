# == Schema Information
#
# Table name: companies
#
#  id              :bigint           not null, primary key
#  address1        :string
#  address2        :string
#  city            :string
#  contact_number  :string
#  country         :string
#  invitation_code :string
#  name            :string
#  postal_code     :string
#  slug            :string
#  state           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_companies_on_slug  (slug) UNIQUE
#
class Company < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :accounts
  has_many :lists
  validates :name, :address1, :city, :state, :postal_code, :country, presence: true
  validates_uniqueness_of :name
end
