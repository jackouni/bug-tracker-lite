require_relative "../config/database_connection"

class User
  attr_reader :id, :username

  def self.delete(id)
  end

  def self.find(id)
  end

  def self.all
  end

  def initialize(id, username, hashed_password)
    @id = id
    @username = username
    @hashed_password= hashed_password
  end
  
  def save
    sql = <<-SQL
      INSERT INTO users (id, username, hashed_password)
      VALUES ($1, $2, $3)
    SQL

    DatabaseConnection.exec_params(sql, [id, username, hashed_password])
  end

  def bugs
  end

  private

  attr_reader :hashed_password
end
