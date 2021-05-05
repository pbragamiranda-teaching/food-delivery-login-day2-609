class Employee

  attr_reader :username, :password, :role

  def initialize(attributes = {})
    @id       = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role     = attributes[:role]
  end

  def self.csv_headers
    ["id", "username", "password", "role"]
  end

  def self.prepare_row(row)
    row[:id] = row[:id].to_i

    row
  end

end
