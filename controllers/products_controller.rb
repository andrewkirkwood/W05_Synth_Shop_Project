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

get '/products/new/?' do
  @products = Product.all
  erb(:"products/new")
end
