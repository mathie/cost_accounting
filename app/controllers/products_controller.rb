class ProductsController < ApplicationController
  before_filter :load_company!, :only => [ :new, :create ]

  def show
    @product = Product.includes(:company).find(params[:id])
    redirect_to product_fixed_direct_costs_path(@product)
  end

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
