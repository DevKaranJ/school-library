# frozen_string_literal: true

require_relative 'person'

# Class representing a student, inheriting from Person
class Student < Person
  attr_accessor :classroom

  # Constructor for the Student class
  def initialize(age, classroom, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  # Method representing playing hooky
  def play_hooky
    '¯\\(ツ)/¯'
  end
end
