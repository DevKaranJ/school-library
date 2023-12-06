# main.rb
require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'student'

# Existing code
person = Person.new(22, name: 'maximilianus')
puts "Original Name: #{person.correct_name}"

capitalized_person = CapitalizeDecorator.new(person)
puts "Capitalized Name: #{capitalized_person.correct_name}"

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts "Capitalized and Trimmed Name: #{capitalized_trimmed_person.correct_name}"

# New code for Classroom and Student
# Create a Classroom
math_classroom = Classroom.new('Math Class')

# Create a Student and add to the Classroom
student = Student.new(16, math_classroom, name: 'Alice')

# Display information
puts "\nStudent Name: #{student.correct_name}"
puts "Student Age: #{student.age}"
puts "Student Classroom: #{student.classroom.label}"

# Display Classroom information
puts "\nClassroom Label: #{math_classroom.label}"
puts "Classroom Students: #{math_classroom.students.map(&:correct_name)}"
