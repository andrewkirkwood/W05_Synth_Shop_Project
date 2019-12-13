require_relative( '../db/sql_runner' )

class Manufacturer

  attr_reader( :id, :name )

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
    def self.all()
      sql = "SELECT * FROM manufacturers"
      results = SqlRunner.run( sql )
      return results.map { |hash| Manufacturer.new( hash ) }
    end
  end

end
