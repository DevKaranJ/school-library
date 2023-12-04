require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(id, name = 'Unknown', age = 0, parent_permission = true, classroom)
    super(id, name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
