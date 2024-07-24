class AddressesController < ApplicationController
  before_action :set_target

  def states
    @outcome = CS.states(params[:country]).invert
  end

  def cities
    @outcome = CS.cities(params[:state], params[:country])
  end

  private

  def set_target
    @target = params[:target]
  end
end
