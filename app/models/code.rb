# == Schema Information
#
# Table name: codes
#
#  id                 :bigint           not null, primary key
#  confirmation_token :string(128)      not null
#  ip                 :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Code < ApplicationRecord
end
