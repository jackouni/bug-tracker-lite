require "pg"

class DatabaseConnection
  def self.connection
    @connection ||= PG.connect(ENV["DATABASE_URL"] || { dbname: "bug-tracker-lite" })
  end

  def self.exec_params(query, params = [])
    connection.exec_params(query, params)
  end

  def self.query(statement, *params)
    p "#{statement} -- Params: #{params}"
    connection.exec_params(statement, params)
  end
end
