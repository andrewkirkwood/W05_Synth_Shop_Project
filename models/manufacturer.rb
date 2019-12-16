require_relative( '../db/sql_runner' )

class Manufacturer

  attr_reader( :id)
  attr_accessor( :name)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO manufacturers
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM manufacturers"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM manufacturers"
    results = SqlRunner.run( sql )
    return results.map { |hash| Manufacturer.new( hash ) }
  end

  def update()
    sql = "UPDATE manufacturers
    SET
    name  =  $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM manufacturers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Manufacturer.new( results.first )
  end
end
