require 'csv'
require_relative 'base_repository'
require_relative '../models/employee'

class EmployeeRepository < BaseRepository

  # undef_method :create

  def initialize(csv_file_path)
    super(csv_file_path, Employee)
    # @employees = []
  end

  def find_by_username(username)
    @elements.find { |employee| employee.username == username}
  end

  def find_all_riders
    @elements.select { |employee| employee.role == 'rider'}
  end

end
