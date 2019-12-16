require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/manufacturer.rb' )
require_relative( '../models/product.rb' )

also_reload( '../models/*' )

get '/manufacturers' do
  @manufacturers = Manufacturer.all
  erb (:"manufacturers/index")
end

get '/manufacturers/new/?' do
  @manufacturers = Manufacturer.all
  @products = Product.all
  erb(:"manufacturers/new")
end
