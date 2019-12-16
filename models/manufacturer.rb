require_relative( '../db/sql_runner' )

class Manufacturer

  attr_reader( :id)
  attr_accessor( :name, :contact_name, :contact_number)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact_name = options['contact_name']
    @contact_number = options['contact_number']
  end

  def save
    sql = "INSERT INTO manufacturers
    (
      name,
      contact_name,
      contact_number
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @contact_name, @contact_number]
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
    SET (
      name,
      contact_name,
      contact_number)
      =  ($1, $2, $3)
      WHERE id = $4"
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
