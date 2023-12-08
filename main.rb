# main.rb
require_relative 'app'
require 'date'

# Create an instance of LibraryApp
library_app = LibraryApp.new

# Interactive menu
loop do
  puts "\nLibrary Management System"
  puts "1. List all books"
  puts "2. List all people"
  puts "3. Create a person"
  puts "4. Create a book"
  puts "5. Create a rental"
  puts "6. List rentals for a person"
  puts "7. Exit"
  print "Enter your choice: "
  choice = gets.chomp.to_i

  case choice
  when 1
    library_app.list_all_books
  when 2
    library_app.list_all_people
  when 3
    print "Enter age: "
    age = gets.chomp.to_i
    print "Enter name: "
    name = gets.chomp
    print "Parent permission? (true/false): "
    parent_permission = gets.chomp.downcase == 'true'
    library_app.create_person(age, name, parent_permission: parent_permission)
  when 4
    print "Enter book title: "
    title = gets.chomp
    print "Enter author: "
    author = gets.chomp
    library_app.create_book(title, author)
  when 5
    print "Enter rental date (YYYY-MM-DD): "
    rental_date = Date.parse(gets.chomp)
    print "Enter person ID: "
    person_id = gets.chomp.to_i
    print "Enter book title: "
    book_title = gets.chomp
    library_app.create_rental(rental_date, person_id, book_title)
  when 6
    print "Enter person ID: "
    person_id = gets.chomp.to_i
    library_app.list_rentals_for_person(person_id)
  when 7
    puts "Exiting..."
    break
  else
    puts "Invalid choice. Please try again."
  end
end
