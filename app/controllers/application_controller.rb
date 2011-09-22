class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  protected
  def load_company!
    @company = current_user.companies.find(params[:company_id])
  end
end
