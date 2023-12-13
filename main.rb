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
    library_app.create_person_prompt
  when 4
    print 'Enter book title: '
    title = gets.chomp
    print 'Enter book author: '
    author = gets.chomp
    library_app.create_book(title, author)
  when 5
    library_app.create_rental_with_indices
  when 6
    print 'Enter person ID: '
    person_id = gets.chomp.to_i
    library_app.list_rentals_for_person(person_id)
  when 7
    library_app.save_data
    puts 'Exiting...'
    exit
  else
    puts 'Invalid choice. Please try again.'
  end
end

# Create an instance of LibraryApp and load data
library_app = LibraryApp.new
library_app.load_data

# Interactive menu
loop do
  LibraryMenu.display
  choice = LibraryMenu.choice
  handle_choice(choice, library_app)
end
