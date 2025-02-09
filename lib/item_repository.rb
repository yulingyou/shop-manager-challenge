require_relative 'database_connection'
require_relative 'item'

class ItemRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, unit_price, quantity FROM items;
    sql = 'SELECT id, name, unit_price, quantity FROM items;'

    # Returns an array of item objects.
    result_set = DatabaseConnection.exec_params(sql,[])

    items = []

    result_set.each do |record|
      item = Item.new
      item.id = record['id']
      item.name = record['name']
      item.unit_price = record['unit_price']
      item.quantity = record['quantity']

      items << item
    end
    return items
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def create(item)
    sql = 'INSERT INTO items (name, unit_price, quantity) VALUES($1, $2, $3);'
    sql_params = [item.name, item.unit_price, item.quantity]

    DatabaseConnection.exec_params(sql, sql_params)
    return nil
  end
end
