require "pg"

module DatabaseSetup
  def self.db_setup
    return if db_exists?
    create_db
    setup_schema
  end
  
  private

  def create_db
    sql = "CREATE DATABASE bug-tracker-lite"
    postgres = self.connect
    postgres.exec(sql)
    self.log(sql)
    postgres.close
  end

  def self.setup_schema
    schema_sql = File.read('schema.sql')
    db = connect('bug-tracker-lite')
    db.exec(schema_sql)
    log "Executed schema.sql"
    db.close
  end

  def self.connect
    PG.connect(dbname: 'postgres')
  end

  def self.log(statement)
    puts "DatabaseSetup: #{statement};"
  end

  def self.db_exists?
    sql = "SELECT COUNT(*) FROM pg_database WHERE datname = 'bug-tracker-lite'"
    postgres = connect
    result = postgres.exec(sql).first
    log(sql)
    postgres.close
    result['count'] == '1'
  end
end