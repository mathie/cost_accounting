class ProductsController < ApplicationController
  before_filter :load_company!

  def new
    @product = @company.products.new
  end

  def create
    @product = @company.products.build(params[:product])
    if @product.save
      redirect_to @company, notice: 'Product successfully created'
    else
      render action: 'new'
    end
  end

  private
  def load_company!
    @company = current_user.companies.find(params[:company_id])
  end
end
