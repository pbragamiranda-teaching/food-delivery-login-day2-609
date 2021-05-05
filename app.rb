# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative 'app/models/meal'
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'

require_relative 'app/models/customer'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'

require_relative 'app/models/employee'
require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/sessions_controller'

require_relative "app/repositories/order_repository"
require_relative "app/controllers/orders_controller"

require_relative 'router'

customer_repo = CustomerRepository.new('data/customers.csv')
customers_controller = CustomersController.new(customer_repo)

meal_repo = MealRepository.new('data/meals.csv')
meals_controller = MealsController.new(meal_repo)

employee_repo = EmployeeRepository.new('data/employee.csv')
sessions_controller = SessionsController.new(employee_repo)

order_repo = OrderRepository.new('data/orders.csv', meal_repo, customer_repo, employee_repo)
orders_controller = OrdersController.new(meal_repo, customer_repo, employee_repo, order_repo)


router = Router.new(meals_controller, customers_controller, sessions_controller, orders_controller)
router.run

# meal = meals_repo.find(1)
# customer = customers_repo.find(1)

# Ruby
# Duck Typing
# If it QUACKS,
# I don't care if it's a duck!
# [meal, customer].each do |element|
#   element.to_csv
# end
