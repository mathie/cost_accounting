class StockItemsController < ApplicationController
  before_filter :load_company!, :only => [ :index, :new, :create ]

  def index
    @stock_items = @company.stock_items
  end

  def new
    @stock_item = @company.stock_items.new
  end

  def create
    @stock_item = @company.stock_items.build(params[:stock_item])
    if @stock_item.save
      redirect_to company_stock_items_path, notice: 'Stock item successfully created'
    else
      render action: 'new'
    end
  end
end
