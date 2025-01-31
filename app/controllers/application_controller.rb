class ApplicationController < ActionController::Base
  include Clearance::Controller

  def flash_message(type:, messages: nil)
    flash.now[type.to_sym] = messages
    render turbo_stream: turbo_stream.update('flash-messages', partial: 'shared/flash',
                                                               locals: { type:, messages: })
  end
end
