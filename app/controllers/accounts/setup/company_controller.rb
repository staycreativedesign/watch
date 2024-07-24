module Accounts
  module Setup
    class CompanyController < ApplicationController
      def new; end

      def create
        @company = Company.new(company_params)
        if @company.valid?
          binding.pry
          @company.save
          # foo
        else
          flash_message(type: 'error',
                        messages: @company.errors)
        end
      end

      def update
        # foo
      end

      def edit
        # foo
      end

      def company_params
        params.require(:company).permit(:address1, :address2, :name, :city, :state, :postal_code, :country,
                                        :contact_number, :registration_code)
      end
    end
  end
end
