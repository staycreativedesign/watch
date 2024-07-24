module ApplicationHelper
  def flash_type?(type)
    if type == 'error'
      'error-msg'
    else
      'success-msg'
    end
  end

  def render_flash_stream(type: 'success', messages: nil)
    turbo_stream.update('flash-messages', partial: 'shared/flash',
                                          locals: { type: })
  end
end
