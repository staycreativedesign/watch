module Accounts
  module Setup
    class EmailVerificationController < ValidationsController
      # @outcome/ValidationsController
      def update
        super()
        @outcome = true
        if @outcome
          @account = current_user
          @account.update(confirmed_at: DateTime.now)
          flash.now[:success] = 'Email has been verified'
        else
          flash_message(type: 'error',
                        messages: 'Verification failed!. Either you have entered\n
            a wrong digit or the code has been used already.')
        end
      end

      private

      def set_full_code
        params[:num1] +
          params[:num2] +
          params[:num3] +
          params[:num4] +
          params[:num1]
      end
    end
  end
end
