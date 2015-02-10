require 'pg'
require 'active_record'
require 'pry'

Dir["../models/*.rb"].each do |file|
  require_relative file
end


ActiveRecord::Base.establish_connection(
adapter: :postgresql,
database: :restaurant,
host: :localhost,
port: 9292
)


[
  {
    category: "Breakfast",
    price: 8,
    name: "Bacon",
  },
  {
    category: "Breakfast",
    price: 15,
    name: "Eggs",
  }
]


.each do |food|
  Food.create( food )
end

[
  {
    table_number: 1, 
    guests: 3,
    paid: true,
  },
  {
    table_number: 2,
    guests: 4,
    paid: true,
  }
]

.each do |party|
  Party.create( party )
end

[
  {
    food_id: 1,
    party_id: 1, 
  },
  {
    food_id: 2,
    party_id: 2,
  }
]

.each do |order|
  order.create( order )
end

