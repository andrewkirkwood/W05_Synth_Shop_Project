require_relative( '../db/sql_runner' )

class Product

  attr_reader( :id, :name, :description, :buy_cost, :sell_price, :stock_qty, :sales_qty)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @buy_cost = options['buy_cost']
    @sell_price = options['sell_price']
    @stock_qty = options['stock_qty']
    @sales_qty = options['sales_qty']
  end

  def save
    sql = "INSERT INTO products
      (
        name,
        description,
        buy_cost,
        sell_price,
        stock_qty,
        sales_qty
      )
      VALUES
      (
        $1, $2, $3, $4, $5, $6
      )
      RETURNING id"
      values = [@name]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
    end

    def self.delete_all
    sql = "DELETE FROM products"
    SqlRunner.run( sql )
  end

end
