# student.rb
require_relative 'person'
require_relative 'classroom'

# Class representing a student, inheriting from Person
class Student < Person
  attr_reader :classroom

  # Constructor for the Student class
  def initialize(age, classroom, name: 'Unknown', parent_permission: true, id: nil)
    super(age, name: name, parent_permission: parent_permission, id: id)
    classroom&.add_student(self)
    @classroom = classroom
  end

  # Method representing playing hooky
  def play_hooky
    '¯\\(ツ)/¯'
  end
end
