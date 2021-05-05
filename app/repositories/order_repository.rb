require 'csv'
require_relative '../models/order'
require "pry-byebug"
class OrderRepository

  def initialize(csv_file_path, meal_repo, customer_repo, employee_repo)
    @csv_file_path = csv_file_path
    @meal_repository = meal_repo
    @customer_repository = customer_repo
    @employee_repository = employee_repo
    @orders = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def create(order)
    order.id = @orders.empty? ? 1 : @next_id
    @next_id += 1
    @orders << order
    save_csv
  end

  def undelivered_orders
    @orders.select {|order| order.delivered? == false}
  end

  def my_undelivered_orders(employee)
    @orders.select {|order| order.delivered? == false && order.employee == employee}
  end



  def load_csv
    csv_options = {
      quote_char: '"',
      col_sep: ',',
      headers: :first_row,
      header_converters: :symbol
    }

    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id]        = row[:id].to_i
      row[:meal]      = @meal_repository.find(row[:meal_id].to_i)
      row[:customer]  = @customer_repository.find(row[:customer_id].to_i)
      row[:employee]  = @employee_repository.find(row[:employee_id].to_i)
      row[:delivered] = row[:delivered] == "true"
      @orders << Order.new(row)
      @next_id += 1
    end
  end

  def save_csv

    csv_options = {
      col_sep: ",",
      quote_char: '"',
      force_quotes: true
    }

    CSV.open(@csv_file_path, "wb", csv_options) do |csv|
      csv << %w[id, delivered, meal_id, customer_id, employee_id]
      @orders.each do |order|
        csv << [order.id, order.delivered?, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end


end
