require_relative( "../models/manufacturer.rb" )
require_relative( "../models/product.rb" )

require("pry-byebug")

Manufacturer.delete_all()
manufacturer1 = Manufacturer.new({"name" => "John"})
manufacturer1.save
