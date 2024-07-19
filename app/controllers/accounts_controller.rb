class AccountsController < Clearance::BaseController
  before_action :redirect_signed_in_accounts, only: %i[create new]
  skip_before_action :require_login, only: %i[create new], raise: false

  def new
    @account = Account.new
    render template: 'accounts/new'
  end

  def create
    @account = Account.new(account_params)
    if @account.valid?
      @account.save
      @account.update(invitation_code: nil)
      sign_in @account
      redirect_back_or url_after_create
      flash.now[:success] = 'Account has been created'
    else
      flash.now[:alert] = @account.errors
      flash_message(type: 'alert', messages: @account.errors)
    end
  end

  private

  def redirect_signed_in_accounts
    return unless signed_in?

    account_dashboard_path(current_user)
  end

  def url_after_create
    account_dashboard_path(current_user)
  end

  def account_params
    params.require(:account).permit(:email, :first_name, :last_name, :password, :password_confirmation,
                                    :invitation_code, :company_id)
  end
end
