# student.rb
require_relative 'person'
require_relative 'classroom'

# Class representing a student, inheriting from Person
class Student < Person
  attr_accessor :classroom

  # Constructor for the Student class
  def initialize(age, classroom, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    classroom&.add_student(self) # Use safe navigation to add the student to the classroom
    @classroom = classroom
  end

  # Method representing playing hooky
  def play_hooky
    '¯\\(ツ)/¯'
  end
end
