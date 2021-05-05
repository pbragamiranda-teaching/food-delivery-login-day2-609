class EmployeesView

  def list(array_of_employees)
    array_of_employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username} - #{employee.role}"
    end
  end

  def ask_for_index
    puts "which index?"
    gets.chomp.to_i - 1
  end

end
