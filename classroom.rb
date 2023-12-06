# classroom.rb
class Classroom
  attr_accessor :label
  attr_reader :students

  # Constructor for the Classroom class
  def initialize(label)
    @label = label
    @students = []
  end

  # Method to add a student to the classroom
  def add_student(student)
    @students << student
    student.instance_variable_set(:@classroom, self)
  end
end
