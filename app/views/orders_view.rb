class OrdersView

  def list(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.employee.username} should deliver #{order.meal.name} to #{order.customer.name}"
    end
  end

  def ask_for_index
    puts "which index?"
    gets.chomp.to_i - 1
  end

end
