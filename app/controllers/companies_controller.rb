class CompaniesController < ApplicationController
  def index
    @companies = current_user.companies.order(:name)
  end

  def show
    @company = current_user.companies.find(params[:id])
    redirect_to company_products_path(@company)
  end

  def new
    @company = current_user.companies.new
  end

  def edit
    @company = current_user.companies.find(params[:id])
  end

  def create
    @company = current_user.companies.build(params[:company])
    if @company.save
      redirect_to companies_path, notice: 'Company successfully created'
    else
      render action: 'new'
    end
  end

  def update
    @company = current_user.companies.find(params[:id])
    if @company.update_attributes(params[:company])
      redirect_to companies_path, notice: 'Company successfully updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    @company = current_user.companies.find(params[:id])
    if @company.destroy
      redirect_to companies_path, notice: 'Company successfully deleted'
    else
      redirect_to companies_path, alert: 'Company could not be deleted'
    end
  end
end
