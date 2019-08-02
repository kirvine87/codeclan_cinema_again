require('pry-byebug')
require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')

customer1 = Customer.new({
  'name' => 'George wise',
  'funds' => '500'
  })

customer2 = Customer.new({
  'name' => 'Dave young',
  'funds' => '200'
  })

customer3 = Customer.new({
  'name' => 'James rae',
  'funds' => '300'
  })

film1 = Film.new({
  'title' => 'Avengers',
  'price' => 7
  })

film2 = Film.new({
  'title' => 'Harry Potter',
  'price' => 6
  })

film3 = Film.new({
  'title' => 'Lord of the Rings',
  'price' => 6
  })

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film2.id
  })

ticket3 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film3.id
  })

binding.pry

nil
