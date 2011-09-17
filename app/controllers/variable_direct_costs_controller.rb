class VariableDirectCostsController < ApplicationController
  before_filter :load_product!, :only => [ :index, :new, :create ]

  def index
    @variable_direct_costs = @product.variable_direct_costs
  end

  def new
    @variable_direct_cost = @product.variable_direct_costs.new
  end

  def create
    @variable_direct_cost = @product.variable_direct_costs.build(params[:variable_direct_cost])
    if @variable_direct_cost.save
      redirect_to product_variable_direct_costs_path(@product), notice: 'Variable direct cost created successfully.'
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
