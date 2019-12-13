require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/manufacturer')

class TestManufacturer < Minitest::Test

  def setup
    @manufacturer1 = Manufacturer.new({"name" => "John"})

  end

end
