require_relative( "../models/manufacturer.rb" )
require_relative( "../models/product.rb" )

require("pry-byebug")

Manufacturer.delete_all()
Product.delete_all()

manufacturer1 = Manufacturer.new({"name" => "Roland", "contact_name" => "John Roland", "contact_number" => "0123456789"})
manufacturer1.save
manufacturer2 = Manufacturer.new({"name" => "Korg", "contact_name" => "Ken Korg", "contact_number" => "9876543210"})
manufacturer2.save
manufacturer3 = Manufacturer.new({"name" => "Moog", "contact_name" => "Bob Moog", "contact_number" => "54321678910"})
manufacturer3.save
manufacturer4 = Manufacturer.new({"name" => "Arturia", "contact_name" => "Alfred Arturia", "contact_number" => "678493920"})
manufacturer4.save
manufacturer5 = Manufacturer.new({"name" => "Yamaha", "contact_name" => "Yam Aha", "contact_number" => "747473020"})
manufacturer5.save

product1 = Product.new({
  "name" => "JX03",
  "description" => "Recreation of a classic design.",
  "buy_cost" => "100",
  "sell_price" => "200",
  "stock_qty" => "10",
  "sales_qty" => "15",
  "manufacturer_id" => manufacturer1.id,
  "type" => "Polyphonic"
  })
  product1.save

  product2 = Product.new({
    "name" => "Volca Fm",
    "description" => "Portable FM synthesizer",
    "buy_cost" => "50",
    "sell_price" => "100",
    "stock_qty" => "5",
    "sales_qty" => "20",
    "manufacturer_id" => manufacturer2.id,
    "type" => "Polyphonic"
    })
    product2.save

    product3 = Product.new({
      "name" => "Volca Modular",
      "description" => "Portable modular synthesizer",
      "buy_cost" => "50",
      "sell_price" => "100",
      "stock_qty" => "0",
      "sales_qty" => "20",
      "manufacturer_id" => manufacturer2.id,
      "type" => "Monophonic"
      })
      product3.save

      product4 = Product.new({
        "name" => "Minibrute 2 ",
        "description" => "Analog synthesizer",
        "buy_cost" => "300",
        "sell_price" => "450",
        "stock_qty" => "3",
        "sales_qty" => "4",
        "manufacturer_id" => manufacturer4.id,
        "type" => "Monophonic"
        })
        product4.save

        product5 = Product.new({
          "name" => "Sub 37",
          "description" => "Paraphonic analogue synthesizer",
          "buy_cost" => "600",
          "sell_price" => "780",
          "stock_qty" => "7",
          "sales_qty" => "0",
          "manufacturer_id" => manufacturer3.id,
          "type" => "Monophonic"
          })
          product5.save

          product6 = Product.new({
            "name" => "Minilogue XD",
            "description" => "Analogue polyphonic with customisation features",
            "buy_cost" => "450",
            "sell_price" => "560",
            "stock_qty" => "15",
            "sales_qty" => "13",
            "manufacturer_id" => manufacturer2.id,
            "type" => "Polyphonic"
            })
            product6.save

            product7 = Product.new({
              "name" => "Juno 106",
              "description" => "Classic vintage synthesizer from the 80s",
              "buy_cost" => "800",
              "sell_price" => "1100",
              "stock_qty" => "0",
              "sales_qty" => "5",
              "manufacturer_id" => manufacturer1.id,
              "type" => "Polyphonic"
              })
              product7.save

              product8 = Product.new({
                "name" => "DX7",
                "description" => "FM synthesizer classic from the 80s",
                "buy_cost" => "500",
                "sell_price" => "700",
                "stock_qty" => "4",
                "sales_qty" => "15",
                "manufacturer_id" => manufacturer5.id,
                "type" => "Polyphonic"
                })
                product8.save
