require_relative '../views/sessions_view'

class SessionsController

  def initialize(employee_repo)
    @sessions_view = SessionsView.new
    @employee_repo = employee_repo
  end

  def login
    #1. Ask user for username
    username = @sessions_view.ask_for("username")
    #2. Ask user for password
    password = @sessions_view.ask_for("password")
    #3. Check repo if username valid
    employee = @employee_repo.find_by_username(username)
    #4. Check repo if password valid
    # a) password is matching
    # b) wrong credentials
    if employee && employee.password == password
      @sessions_view.login_sucessful(employee)
      employee
    else
      @sessions_view.wrong_credentials
      login # recursive
    end
  end

end
