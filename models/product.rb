require_relative( '../db/sql_runner' )

class Product

  attr_reader( :id )
  attr_accessor( :name, :description, :buy_cost, :sell_price, :stock_qty, :sales_qty, :manufacturer_id)


  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @buy_cost = options['buy_cost'].to_i
    @sell_price = options['sell_price'].to_i
    @stock_qty = options['stock_qty'].to_i
    @sales_qty = options['sales_qty'].to_i
    @manufacturer_id = options['manufacturer_id'].to_i
  end

  def save
    sql = "INSERT INTO products
    (
      name,
      description,
      buy_cost,
      sell_price,
      stock_qty,
      sales_qty,
      manufacturer_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING id"
    values = [@name, @description, @buy_cost, @sell_price, @stock_qty, @sales_qty, @manufacturer_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM products"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM products"
    results = SqlRunner.run( sql )
    return results.map { |hash| Product.new( hash ) }
  end

  def update()
    sql = "UPDATE products
    SET
    (
      name,
      description,
      buy_cost,
      sell_price,
      stock_qty,
      sales_qty,
      manufacturer_id
      ) =
      (
        $1, $2, $3, $4, $5, $6, $7
      )
      WHERE id = $8"
      values = [@name, @description, @buy_cost, @sell_price, @stock_qty, @sales_qty, @manufacturer_id, @id]
      SqlRunner.run(sql, values)
    end

    def manufacturer()
      manufacturer = Manufacturer.find(@manufacturer_id)
      return manufacturer.name
    end

    def self.find( id )
      sql = "SELECT * FROM products
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return Product.new( results.first )
    end

  end
