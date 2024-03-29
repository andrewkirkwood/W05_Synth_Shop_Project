require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/manufacturer.rb' )
require_relative( '../models/product.rb' )

also_reload( '../models/*' )

get '/manufacturers/?' do
  @manufacturers = Manufacturer.all
  erb (:"manufacturers/index")
end

get '/manufacturers/new/?' do
  @manufacturers = Manufacturer.all
  erb(:"manufacturers/new")
end

get '/manufacturers/:id/?' do
  @manufacturer = Manufacturer.find(params[:id].to_i)
  erb(:"manufacturers/show")
end

post '/manufacturers/?' do
  @manufacturer = Manufacturer.new( params )
  @manufacturer.save
  redirect to (:"manufacturers/")
end

get '/manufacturers/:id/edit/?' do
  @manufacturer = Manufacturer.find(params[:id].to_i)
  erb(:"manufacturers/edit")
end

post '/manufacturers/:id/update/?' do
  Manufacturer.new(params).update
  erb(:"manufacturers/update")
end
