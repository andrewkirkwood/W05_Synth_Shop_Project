require_relative( "../models/manufacturer.rb" )
require_relative( "../models/product.rb" )

require("pry-byebug")

Manufacturer.delete_all()
Product.delete_all()

manufacturer1 = Manufacturer.new({"name" => "Roland"})
manufacturer1.save
manufacturer2 = Manufacturer.new({"name" => "Korg"})
manufacturer2.save

product1 = Product.new({
  "name" => "JX03",
  "description" => "Recreation of a classic design.",
  "buy_cost" => "100",
  "sell_price" => "200",
  "stock_qty" => "10",
  "sales_qty" => "15",
  "manufacturer_id" => manufacturer1.id
  })

  product1.save
