class CustomersView

  def list(array_of_customers)
    array_of_customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name} - #{customer.address}"
    end
  end

  def ask_for(customer_attribute)
    puts "What's the #{customer_attribute}?"
    gets.chomp
  end

  def ask_for_index
    puts "which index?"
    gets.chomp.to_i - 1
  end

end
