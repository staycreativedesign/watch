class Account < ApplicationRecord
  include Clearance::User
end
