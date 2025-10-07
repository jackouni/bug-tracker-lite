require_relative "../config/database_connection"

class Bug
  attr_reader :id, :title, :description, :status, :project_id, :deadline

  def self.create(title, description, project_id)
  end

  def self.delete(id)
  end

  def self.find(id)
  end

  def self.all
  end

  def initialize(id, title, description, status, project_id, deadline = nil)
    @id = id
    @title = title
    @description = description
    @status = status
    @project_id = project_id
    @deadline = deadline
  end 

  def to_h
    {
      id: id,
      title: title,
      description: description,
      status: status,
      project_id: project_id
    }
  end
end
