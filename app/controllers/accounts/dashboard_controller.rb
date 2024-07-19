module Accounts
  class DashboardController < ApplicationController
    before_action :find_account
    def show; end

    private

    def find_account
      @account = Account.find(params[:account_id])
    end
  end
end
