require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/manufacturer.rb' )
require_relative( '../models/product.rb' )

also_reload( '../models/*' )

get '/products/?' do
  @types = Product.all_types
  @manufacturers = Manufacturer.all
  if params[:manufacturer]
    @manufacturer = Manufacturer.find(params[:manufacturer])
    @products = @manufacturer.products(@manufacturer.id)
  elsif params[:type]
    @products = Product.give_all_by_type(params[:type])
  else
    @products = Product.all
  end
  erb (:"products/index")
end

get '/products/new/?' do
  @manufacturers = Manufacturer.all
  @types = Product.all_types
  erb(:"products/new")
end

get '/products/:id/?' do
  @product = Product.find(params[:id].to_i)
  erb(:"products/show")
end

post '/products/?' do
  @product = Product.new(params)
  @product.save
  redirect to ("/products")
end

get '/products/:id/edit/?' do
  @types = Product.all_types
  @manufacturers = Manufacturer.all()
  @product = Product.find(params[:id].to_i)
  erb(:"products/edit")
end

post '/products/:id/update' do
  @product = Product.new(params)
  @product.update
  # binding.pry
  erb(:"products/update")
end

get '/products/:id/sell/?' do
  @product = Product.find(params[:id].to_i)
  erb(:"products/sell")
end
