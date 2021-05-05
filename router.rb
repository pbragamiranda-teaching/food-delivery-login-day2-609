class Router

  def initialize(meals_controller, customers_controller, sessions_controller)
    @running = true
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
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
    puts "1 - List all meals"
    puts "2 - Create a meal"
    puts "3 - List all customers"
    puts "4 - Create a customer"
    puts "5 - Exit"
  end

  def route_to_manager(user_option)
    case user_option
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5
      @running  = false
      @employee = nil
    else
      puts "Invalid option, please choose a valid one."
    end
  end

  def display_tasks_rider
    puts "1 - Mark order as delivered"
    puts "2 - List all my orders"
  end

  def route_to_rider(user_option)
    case user_option
    when 1 then puts "TODO: mark as delivered"
    when 2 then puts "TODO: list my orders"
    when 5 then
      @running  = false
      @employee = nil
    else
      puts "Invalid option, please choose a valid one."
    end
  end

end
