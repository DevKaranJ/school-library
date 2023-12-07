# main.rb
require_relative 'app'
require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require 'date'

original_person = Person.new(22, name: 'maximilianus')
puts "Original Name: #{original_person.correct_name}"

capitalized_person = CapitalizeDecorator.new(original_person)
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

# Create a new Person
another_person = Person.new(22, name: 'John')

# Create a Book
book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')

# Create a Rental and associate it with the new Person and Book
rental_date = Date.new(2023, 12, 15)
rental = Rental.new(rental_date, another_person, book)

# Display information
puts "\nAnother Person Details:"
puts "Name: #{another_person.correct_name}"
puts "Age: #{another_person.age}"
puts "Rentals: #{another_person.rentals.map { |r| "#{r.book.title} on #{r.date}" }}"

puts "\nBook Details:"
puts "Title: #{book.title}"
puts "Author: #{book.author}"
puts "Rentals: #{book.rentals.map { |r| "#{r.person.correct_name} on #{r.date}" }}"

puts "\nRental Details:"
puts "Date: #{rental.date}"
puts "Person: #{rental.person.correct_name}"
puts "Book: #{rental.book.title}"

# Create an instance of LibraryApp
library_app = LibraryApp.new

# Use the LibraryApp methods
library_app.list_all_books
library_app.list_all_people
library_app.create_person(25, 'Emma', false)
library_app.create_book('Ruby Programming', 'John Doe')
library_app.create_rental(Date.new(2023, 12, 20), 1, 'The Great Gatsby')
library_app.list_rentals_for_person(1)
