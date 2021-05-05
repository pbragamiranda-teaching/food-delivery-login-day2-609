require_relative 'app/repositories/employee_repository'


csv_employee = 'data/employee.csv'
employee_repo = EmployeeRepository.new(csv_employee)

p employee_repo
