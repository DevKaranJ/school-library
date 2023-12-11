# library_menu.rb
class LibraryMenu
  def self.display
    puts "\nLibrary Management System"
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Exit'
  end

  def self.choice
    print 'Enter your choice: '
    gets.chomp.to_i
  end

  def self.display_create_person_options
    puts 'Choose the type of person to create:'
    puts '1. Teacher'
    puts '2. Student'
  end
end
