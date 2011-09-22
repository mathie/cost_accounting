class ProductsController < ApplicationController
  before_filter :load_company!, :only => [ :index, :new, :create ]

  def index
    @products = @company.products
  end

  def show
    @product = Product.includes(:company).find(params[:id])
    @company = @product.company
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
end
