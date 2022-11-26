require 'order'
require 'database_connection'

class OrderRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, customer_name, order_date FROM orders;
    sql = 'SELECT id, customer_name, order_date FROM orders;'
    # Returns an array of order objects.
    result_set = DatabaseConnection.exec_params(sql,[])
    orders = []

    result_set.each do |record|
      order = Order.new
      order.id = record['id']
      order.customer_name = record['customer_name']
      order.order_date = record['order_date']
      orders << order
    end
    return orders
  end

  # Add more methods below for each operation you'd like to implement.

  def create(order)
  end

  # def update(order)
  # end

  # def delete(order)
  # end
end
