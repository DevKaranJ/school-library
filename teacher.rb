require_relative 'person'

# Class representing a teacher, inheriting from Person
class Teacher < Person
  attr_accessor :specialization

  # Constructor for the Teacher class
  def initialize(age, specialization, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  # Override can_use_services? to always return true for teachers
  def can_use_services?
    true
  end
end
