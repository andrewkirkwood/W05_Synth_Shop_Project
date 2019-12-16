require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/manufacturer.rb' )
require_relative( '../models/product.rb' )

also_reload( '../models/*' )

get '/products' do
  @products = Product.all
  erb (:"products/index")
end

get '/products/:id/?' do
  @product = Product.find(params[:id].to_i)
  erb(:"products/show")
end

get '/products/new/?' do
  @manufacturers = Manufacturer.all
  @products = Product.all
  erb(:"products/new")
end

post '/products/?' do
  @product = Product.new(params)
  @product.save
  redirect to ("/products")
end
