require_relative("../db/sql_runner.rb")
require_relative("./film.rb")

 class Customer

   attr_reader :id
   attr_accessor :name, :funds

   def initialize(options)
     @id = options['id'].to_i() if options['id']
     @name = options['name']
     @funds = options['funds'].to_i()
   end

   def save()
     sql = "INSERT INTO customers (name, funds) VALUES ($1, $2)
     RETURNING id"
     values = [@name, @funds]
     customer = SqlRunner.run(sql, values)[0]
     @id = customer['id'].to_i()
   end

   def update()
     sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
     values = [@name, @funds, @id]
     SqlRunner.run(sql, values)
   end

   def self.delete_all()
     sql = "DELETE FROM customers"
     SqlRunner.run(sql)
   end

   def delete()
     sql = "DELETE FROM customers WHERE id = $1"
     values = [@id]
     SqlRunner.run(sql, values)
   end

   def self.all()
     sql = "SELECT * FROM customers"
     customers = SqlRunner.run(sql)
     return customers.map{|customer| Customer.new(customer)}
   end

   def films()
     sql = "SELECT films.* FROM films INNER JOIN tickets ON
     films.id = tickets.film_id WHERE tickets.customer_id = $1"
     values = [@id]
     films = SqlRunner.run(sql, values)
     return films.map{|film| Film.new(film)}
   end

   def pay()
    sql = "SELECT SUM(films.price) FROM films INNER JOIN tickets ON
    films.id = tickets.film_id WHERE tickets.customer_id = $1"
    values = [@id]
    fee = SqlRunner.run(sql, values)[0]['sum'].to_i()
    return @funds - fee
   end

   def tickets()
     films = films().count()
     return films
   end

 end
