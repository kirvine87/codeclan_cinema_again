require('pry-byebug')
require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

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

  customer1.save()
  customer2.save()
  customer3.save()

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

  film1.save()
  film2.save()
  film3.save()

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

  ticket1.save()
  ticket2.save()
  ticket3.save()

  customer1.funds = 600
  customer1.update()

  film1.price = 10
  film1.update()

  ticket1.customer_id = customer2.id
  ticket1.update()

  # ticket1.delete()
  # customer1.delete()
  # film1.delete()

binding.pry

nil
