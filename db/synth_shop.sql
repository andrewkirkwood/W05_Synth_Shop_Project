DROP TABLE products;
DROP TABLE manufacturers;

CREATE TABLE manufacturers
(
  id SERIAL primary key,
  name VARCHAR(255) not null
);

CREATE TABLE products
(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  description VARCHAR(255),
  buy_cost INT,
  sell_price INT,
  stock_qty INT,
  sales_qty INT,
  manufacturer_id INT references manufacturers(id)
);
