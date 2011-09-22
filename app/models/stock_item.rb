class StockItem < ActiveRecord::Base
  belongs_to :company, inverse_of: :stock_items

  def average_usage
    ((minimum_usage + maximum_usage) / BigDecimal('2')).round
  end

  def average_lead_time
    ((minimum_lead_time + maximum_lead_time) / BigDecimal('2')).round
  end

  def reorder_level
    (maximum_usage * maximum_lead_time + buffer).round
  end

  def economic_order_quantity
    (2 * order_cost * annual_demand / holding_cost).sqrt(0).round
  end

  def minimum_inventory_level
    reorder_level - average_usage * average_lead_time
  end

  def maximum_inventory_level
    reorder_level + economic_order_quantity - minimum_usage * minimum_lead_time
  end

  private
  def annual_demand
    maximum_usage * annual_working_weeks
  end

  def annual_working_weeks
    50 # For now.
  end
end
