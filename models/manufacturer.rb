require_relative( '../db/sql_runner' )

class Manufacturer

  attr_reader( :name, :id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

end
