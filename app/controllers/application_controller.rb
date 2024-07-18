class ApplicationController < ActionController::Base
  include Clearance::Controller

  def flash_message(type:, messages:)
    render turbo_stream: turbo_stream.update('flash-messages', partial: 'shared/flash',
                                                               locals: { type: type, messages: messages })
  end
end
