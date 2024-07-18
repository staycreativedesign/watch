class SessionsController < Clearance::SessionsController
  before_action :redirect_signed_in_users, only: [:new]
  skip_before_action :require_login, only: %i[create new destroy], raise: false

  def create
    @account = authenticate(params)

    sign_in(@account) do |status|
      if status.success?
        redirect_back_or url_after_create
      else
        flash.now[:alert] = status.failure_message
        flash_message(type: 'alert', messages: status.failure_message)
      end
    end
  end

  def destroy
    sign_out
    redirect_to url_after_destroy, status: :see_other
  end

  def new
    render template: 'sessions/new'
  end

  private

  def redirect_signed_in_users
    return unless signed_in?

    account_dashboard_path(@account)
  end

  def url_after_create
    account_dashboard_path(@account)
  end

  def url_after_destroy
    Clearance.configuration.url_after_destroy || sign_in_url
  end

  def url_for_signed_in_users
    account_dashboard_path(@account)
  end
end
