require_relative( '../db/sql_runner' )

class Product

  attr_reader( :id )
  attr_accessor( :name, :description, :buy_cost, :sell_price, :stock_qty, :sales_qty, :manufacturer_id, :type)


  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @buy_cost = options['buy_cost'].to_i
    @sell_price = options['sell_price'].to_i
    @stock_qty = options['stock_qty'].to_i
    @sales_qty = options['sales_qty'].to_i
    @manufacturer_id = options['manufacturer_id'].to_i
    @type = options['type']
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
      manufacturer_id,
      type
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    RETURNING id"
    values = [@name, @description, @buy_cost, @sell_price, @stock_qty, @sales_qty, @manufacturer_id, @type]
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
      manufacturer_id,
      type
      ) =
      (
        $1, $2, $3, $4, $5, $6, $7, $8
      )
      WHERE id = $9"
      values = [@name, @description, @buy_cost, @sell_price, @stock_qty, @sales_qty, @manufacturer_id, @type, @id]
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

    def self.all_types()
      sql = "SELECT * FROM products"
      results = SqlRunner.run( sql )
      results2 = results.map { |hash| Product.new(hash) }
      results3 = results2.map {|item| item.type }
      return results3.uniq
    end

    def self.give_all_by_type( type )
      sql = "SELECT * FROM products WHERE type = $1"
      values = [type]
      results = SqlRunner.run( sql, values )
      results2 = results.map { |hash| Product.new(hash) }
      return results2
    end
  end
