class ValidationsController < ApplicationController
  before_action :set_full_code
  def create; end

  def update
    @outcome = ValidationServices.validate!(params[:object], set_full_code)
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
