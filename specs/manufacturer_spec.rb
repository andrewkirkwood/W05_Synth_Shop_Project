require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/manufacturer')

class TestManufacturer < Minitest::Test

  def setup
    @manufacturer1 = Manufacturer.new({"name" => "Roland"})
  end

  # def test_get_id
  #   assert_equal(1, @manufacturer1.id)
  # end

  def test_get_name
    assert_equal("Roland", @manufacturer1.name)
  end

end
