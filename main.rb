# main.rb
require_relative 'app'
require_relative 'library_menu'
require_relative 'library_user_input'

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
  age = LibraryUserInput.get_integer('Enter age')
  name = LibraryUserInput.get_string('Enter name')
  parent_permission = LibraryUserInput.get_boolean('Parent permission?')
  library_app.create_person(age, name, parent_permission: parent_permission)
end

def create_book(library_app)
  title = LibraryUserInput.get_string('Enter book title')
  author = LibraryUserInput.get_string('Enter author')
  library_app.create_book(title, author)
end

def create_rental(library_app)
  rental_date = LibraryUserInput.get_date('Enter rental date')
  person_id = LibraryUserInput.get_integer('Enter person ID')
  book_title = LibraryUserInput.get_string('Enter book title')
  library_app.create_rental(rental_date, person_id, book_title)
end

def list_rentals(library_app)
  person_id = LibraryUserInput.get_integer('Enter person ID')
  library_app.list_rentals_for_person(person_id)
end

# Create an instance of LibraryApp
library_app = LibraryApp.new

# Interactive menu
loop do
  LibraryMenu.display
  choice = LibraryMenu.get_choice
  handle_choice(choice, library_app)
end
