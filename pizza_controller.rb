require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative('./models/pizza_order')
also_reload('./models/*')

# index

get '/pizza-orders' do
  #to bring back array of pizza orders - stored in @orders variable
  @orders = PizzaOrder.all()
  erb(:index)
end

# new
get '/pizza-orders/new' do
  erb(:new)
end

# show
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

# create
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

# edit
get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

# update
post '/pizza-orders/:id' do
  order = PizzaOrder.new(params)
  order.update
  redirect '/pizza-orders'
end
#post
# delete
post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params[:id]).delete
  redirect '/pizza-orders'
end
