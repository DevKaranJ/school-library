require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(id, name = 'Unknown', age = 0, specialization)
    super(id, name, age)
    @specialization = specialization
  end

  # Override can_use_services? method
  def can_use_services?
    true
  end
end
