class CompaniesController < ApplicationController
  def index
    @companies = current_user.companies.order(:name)
  end

  def new
    @company = current_user.companies.new
  end

  def create
    @company = current_user.companies.build(params[:company])
    if @company.save
      redirect_to companies_path, notice: 'Company successfully created'
    else
      render action: 'new'
    end
  end
end
