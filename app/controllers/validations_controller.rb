class ValidationsController < ApplicationController
  before_action :set_full_code
  def create; end

  def update
    if ValidationServices.validate!(params[:object], set_full_code)
    # foo
    else
      flash.now[:alert] =
        'Verification failed!. Either you have entered a wrong digit or the code has been used already.'
      flash_message(type: 'alert')
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
