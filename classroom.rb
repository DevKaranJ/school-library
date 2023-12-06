# classroom.rb

# Class representing a Classroom
class Classroom
  attr_accessor :label, :students

  # Constructor for the Classroom class
  def initialize(label)
    @label = label
    @students = [] # Initialize an empty array to store students
  end

  # Method to add a student to the classroom
  def add_student(student)
    @students << student
    student.classroom = self # Set the classroom for the student
  end
end
