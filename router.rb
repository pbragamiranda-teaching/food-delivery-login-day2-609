class Router

  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @running = true
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
  end

  def run
    @employee = @sessions_controller.login
    while @employee
      while @running
        if @employee.role == "manager"
          display_tasks_manager
          user_option = gets.chomp.to_i
          route_to_manager(user_option)
        else
          display_tasks_rider
          user_option = gets.chomp.to_i
          route_to_rider(user_option)
        end
      end
    end
  end

  def display_tasks_manager
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "5. Add new order"
    puts "6. List all undelivered orders"
    puts "7. Exit"
    print "> "
  end

  def route_to_manager(user_option)
    case user_option
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_undelivered_orders
    when 7 then stop!
    else puts "Try again..."
    end
  end

  def display_tasks_rider
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. List my undelivered orders"
    puts "2. Mark order as delivered"
    puts "3. Exit"
    print "> "
  end

  def route_to_rider(user_option)
    case user_option
    when 1 then @orders_controller.list_my_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    when 3 then stop!
    else puts "Try again..."
    end
  end

  def stop!
    @employee = nil
    @running = false
  end

end
