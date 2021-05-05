class SessionsView

  def ask_for(credential)
    puts "What is your #{credential}"
    gets.chomp
  end

  def login_sucessful(employee)
    if employee.role == "manager"
      puts "[MANAGER] Welcome #{employee.username}!"
    else
      puts "[RIDER] Welcome #{employee.username}!"
    end
  end

  def wrong_credentials
    puts "Ops.. wrong credentials. Try again."
  end

end
