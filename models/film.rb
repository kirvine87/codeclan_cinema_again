require_relative("../db/sql_runner.rb")
require_relative("./customer.rb")

 class Film

   attr_reader :id
   attr_accessor :title, :price

   def initialize(options)
     @id = options['id'].to_i if options['id']
     @title = options['title']
     @price = options['price']
   end

   def save()
     sql = "INSERT INTO films (title, price) VALUES ($1, $2)
     RETURNING id"
     values = [@title, @price]
     movie = SqlRunner.run(sql, values)[0]
     @id = movie['id'].to_i()
   end

   def update()
     sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
     values = [@title, @price, @id]
     SqlRunner.run(sql, values)
   end

   def self.delete_all()
     sql = "DELETE FROM films"
     SqlRunner.run(sql)
   end

   def delete()
     sql = "DELETE FROM films WHERE id = $1"
     values = [@id]
     SqlRunner.run(sql, values)
   end

   def self.all()
     sql = "SELECT * FROM films"
     films = SqlRunner.run(sql)
     return films.map {|film| Film.new(film)}
   end

   def customers()
     sql = "SELECT customers.* FROM customers INNER JOIN tickets ON
     customers.id = tickets.customer_id WHERE tickets.film_id = $1"
     values = [@id]
     customers = SqlRunner.run(sql, values)
     return customers.map{|customer| Customer.new(customer)}
   end

   def popularity()
     popularity = customers().count()
   end

 end
