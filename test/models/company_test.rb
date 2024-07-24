# == Schema Information
#
# Table name: companies
#
#  id                :bigint           not null, primary key
#  address1          :string
#  address2          :string
#  city              :string
#  contact_number    :string
#  country           :string
#  invitation_code   :string
#  name              :string
#  postal_code       :string
#  registration_code :string
#  slug              :string
#  state             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_companies_on_slug  (slug) UNIQUE
#
require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
