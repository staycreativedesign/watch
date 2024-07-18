module ApplicationHelper
  def flash_type?(type)
    if type == 'alert'
      'error-msg'
    else
      'success-msg'
    end
  end
end
