class SemiVariableDirectCostsController < ApplicationController
  before_filter :load_product!, :only => [ :index, :new, :create ]

  def index
    @semi_variable_direct_costs = @product.semi_variable_direct_costs
  end

  def new
    @semi_variable_direct_cost = @product.semi_variable_direct_costs.new
  end

  def create
    @semi_variable_direct_cost = @product.semi_variable_direct_costs.build(params[:semi_variable_direct_cost])
    if @semi_variable_direct_cost.save
      redirect_to product_semi_variable_direct_costs_path(@product), notice: 'Semi-variable direct cost created successfully.'
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
