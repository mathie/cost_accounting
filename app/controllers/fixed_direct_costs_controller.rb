class FixedDirectCostsController < ApplicationController
  before_filter :load_product!, :only => [ :index, :new, :create ]

  def index
    @fixed_direct_costs = @product.fixed_direct_costs
  end

  def new
    @fixed_direct_cost = @product.fixed_direct_costs.new
  end

  def create
    @fixed_direct_cost = @product.fixed_direct_costs.build(params[:fixed_direct_cost])
    if @fixed_direct_cost.save
      redirect_to product_fixed_direct_costs_path(@product), notice: 'Fixed direct cost created successfully.'
    else
      render action: 'new'
    end
  end

  private
  def load_product!
    @product = Product.includes(:company).find(params[:product_id])
    @company = @product.company
  end
end
