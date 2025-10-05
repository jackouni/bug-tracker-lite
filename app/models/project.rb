class Project
  attr_reader :id, :title, :description, :status, :deadline

  def self.create(title, description, project_id)
  end

  def self.delete(id)
  end

  def self.find(id)
  end

  def initialize(id, title, description, status, deadline = nil)
    @id = id
    @title = title
    @description = description
    @status = status
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
