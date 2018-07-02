class LineItem < ApplicationRecord
  belongs_to :corgi
  belongs_to :cart

  def total_price
    corgi.price.to_i * quantity.to_i
  end
end
