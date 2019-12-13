require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/product')

class TestProduct < Minitest::Test

  def setup
    @product1 = Product.new({
      "name" => "JX03",
      "description" => "Recreation of a classic design.",
      "buy_cost" => "100",
      "sell_price" => "200",
      "stock_qty" => "10",
      "sales_qty" => "15"})
  end

  # def test_get_id
  #   assert_equal(1, @manufacturer1.id)
  # end

  def test_get_name
    assert_equal("JX03", @product1.name)
  end

  def test_get_description
    assert_equal("Recreation of a classic design.", @product1.description)
  end

end
