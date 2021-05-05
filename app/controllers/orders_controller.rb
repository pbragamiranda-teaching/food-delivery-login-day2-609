require_relative '../views/meals_view'
require_relative '../views/customers_view'
require_relative '../views/employees_view'
require_relative '../views/orders_view'

require_relative '../models/order'
require "pry-byebug"

class OrdersController
  def initialize(meal_repo, customer_repo, employee_repo, order_repo)
    @meal_repository = meal_repo
    @customer_repository = customer_repo
    @employee_repository = employee_repo
    @order_repository = order_repo
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @employees_view = EmployeesView.new
    @orders_view = OrdersView.new
  end

  def add

    meal = select_meal
    customer = select_customer
    employee = select_employee
    order = Order.new(meal: meal, customer: customer, employee: employee)

    @order_repository.create(order)

  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @orders_view.list(orders)
  end

  def list_my_orders(employee)
    orders = @order_repository.my_undelivered_orders(employee)
    @orders_view.list(orders)
  end

  def mark_as_delivered(employee)
    orders = list_my_orders(employee)
    @orders_view.list(orders)
    index = @orders_view.ask_for_index
    orders[index].deliver!
    @order_repository.save_csv
  end

  private

  def select_meal
    meals = @meal_repository.all
    @meals_view.list(meals)
    index = @orders_view.ask_for_index
    return meals[index]
  end

  def select_customer
    customers = @customer_repository.all
    @customers_view.list(customers)
    index = @orders_view.ask_for_index
    return customers[index]
  end

  def select_employee
    employees = @employee_repository.find_all_riders
    @employees_view.list(employees)
    index = @orders_view.ask_for_index
    return employees[index]
  end

end
