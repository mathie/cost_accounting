class FixedDirectCostsController < ApplicationController
  before_filter :load_product!, :only => [ :index ]

  def index
    @fixed_direct_costs = @product.fixed_direct_costs
  end

  private
  def load_product!
    @product = Product.includes(:company).find(params[:product_id])
    @company = @product.company
  end
end
