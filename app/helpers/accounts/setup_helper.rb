module Accounts
  module SetupHelper

    def show_setup_page
      if current_user.company
        render template: 'accounts/setup/inventory/show', locals: { account: current_user }
      elsif current_user.confirmed_at
        render template: 'accounts/setup/company/show', locals: { account: current_user }
      else
        render template: 'accounts/setup/email_verification/show', locals: { account: current_user }
      end
      
    end
  end
end
