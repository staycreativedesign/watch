# == Schema Information
#
# Table name: invitation_codes
#
#  id         :bigint           not null, primary key
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class InvitationCode < ApplicationRecord
end
