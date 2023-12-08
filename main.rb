# main.rb
require_relative 'app'
require 'date'

def display_menu
  puts "\nLibrary Management System"
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
  puts '7. Exit'
end

def choice
  print 'Enter your choice: '
  gets.chomp.to_i
end

def handle_choice(choice, library_app)
  case choice
  when 1
    library_app.list_all_books
  when 2
    library_app.list_all_people
  when 3
    create_person(library_app)
  when 4
    create_book(library_app)
  when 5
    create_rental(library_app)
  when 6
    list_rentals(library_app)
  when 7
    puts 'Exiting...'
    exit
  else
    puts 'Invalid choice. Please try again.'
  end
end

def create_person(library_app)
  print 'Enter age: '
  age = gets.chomp.to_i
  print 'Enter name: '
  name = gets.chomp
  print 'Parent permission? (true/false): '
  parent_permission = gets.chomp.downcase == 'true'
  library_app.create_person(age, name, parent_permission: parent_permission)
end

def create_book(library_app)
  print 'Enter book title: '
  title = gets.chomp
  print 'Enter author: '
  author = gets.chomp
  library_app.create_book(title, author)
end

def create_rental(library_app)
  print 'Enter rental date (YYYY-MM-DD): '
  rental_date = Date.parse(gets.chomp)
  print 'Enter person ID: '
  person_id = gets.chomp.to_i
  print 'Enter book title: '
  book_title = gets.chomp
  library_app.create_rental(rental_date, person_id, book_title)
end

def list_rentals(library_app)
  print 'Enter person ID: '
  person_id = gets.chomp.to_i
  library_app.list_rentals_for_person(person_id)
end

# Create an instance of LibraryApp
library_app = LibraryApp.new

# Interactive menu
loop do
  display_menu
  choice = choice
  handle_choice(choice, library_app)
end
