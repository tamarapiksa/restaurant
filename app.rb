require 'bundler'
Bundler.require 

ActiveRecord::Base.establish_connection({
  adapter: 'postgresql',
  database: 'restaurant'
  })

Dir["models/*.rb"].each do |file|
  require_relative file
end


get '/dished' do
  erb :'intelliserve/show'
end

get '/parties' do
  @parties = Party.all
  
  erb :'party/index'
end 


get '/parties/new' do
    @party = Party.all

    erb :'party/new'
end

get '/parties/:id' do
  @party = Party.find(params[:id])
  @foods = Food.all
  Pry.start(binding)
  erb :'party/show'
end 

post '/parties/:id' do
    food_id = params["food_id"]
    party_id = params["id"]

    Order.create({food_id:food_id,party_id:party_id})
    redirect to "/parties/#{party_id}"
end 


post '/parties' do  
    @guests = params["party"]["guest"]
    @table_number = params["party"]["table_number"]
    @paid = params["party"]["paid"]

    @party = Party.new({guests: "#{@guests}", table_number: "#{@table_number}", paid: "#{@paid}"})
    if @party.save
        redirect to '/parties'
    else
        erb :'/party/new'
    end
end

get '/parties/:id/edit' do
  @party = Party.find(params['id'])
  
  erb:'parties/edit'
end 

patch '/parties/:id' do
  party = Party.find(params[:id])
  party.update(params['party'])

  redirect to "/parties/#{party.id}"
end 

delete '/parties/:id' do
  party = Party.find(params[:id])
  party.destroy

  redirect to '/parties'
end 

get '/orders' do
  @orders = Order.all

  erb :'order/index'
end 

get '/orders/new' do
  @orders = Order.all

  erb :'order/new'
end 

post '/orders' do
  order = Order.create(params[:order])

  redirect to "/orders/#{order.id}"
end

get '/orders/:id' do
  @order = Order.find(params[:id])

  erb :'order/show'
end

get '/orders/:id/edit' do
  @order = Order.find(params[:id])
  @parties = Party.all

  erb :'order/edit'
end 

patch '/orders/:id' do
  order = Order.find(params[:id])
  order.update(params[:order])

  redirect to "/orders/#{order.id}"
end 

delete '/orders/:id' do
  order = Order.find(params[:id])
  order.destroy

  redirect to '/orders'
end 

get '/foods' do 
  @foods = Food.all

  erb :'food/index'
end 

get '/foods/new' do
  @food = Food.new
  erb :'food/new'
end

get '/foods/:id' do
  foods_id = params[:id]
  @food = Food.find(food_id)

  erb = :'food/show'

end 

post '/foods' do
    @name = params["food"]["name"]
    @category = params["food"]["category"]
    @price = params["food"]["price"]

    @food = Food.new({name: "#{@name}", category: "#{@category}", price: "#{@price}"})
    if @food.save
        redirect to '/foods'
    else
        erb :'/food/new'
    end
end
  
get '/foods/:id/edit' do 
  @food = Food.find(params[:id])


    erb :'/food/show'
end 

patch '/foods/:id' do
  food = Food.find(params[:id])
  food.update(params[:food])

  redirect to "/foods/#{food.id}"
end 

delete '/foods/:id' do
  food = Food.find(params[:id])
  food.destroy

  redirect to "/foods"

end 










get '/download/:filename' do |filename|
  send_file "./files/#{filename}", :filename => filename, :type => 'Application/octet-stream'
end










 





































