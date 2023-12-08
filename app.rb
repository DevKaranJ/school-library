# app.rb
require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'

class LibraryApp
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    puts 'List of all books:'
    @books.each { |book| puts "#{book.title} by #{book.author}" }
  end

  def list_all_people
    puts 'List of all people:'
    @people.each { |person| puts "#{person.correct_name} (ID: #{person.id}, Age: #{person.age})" }
  end

  def create_person_prompt
    puts 'Choose the type of person to create:'
    puts '1. Teacher'
    puts '2. Student'
    print 'Enter your choice: '
    choice = gets.chomp.to_i

    case choice
    when 1
      create_teacher
    when 2
      create_student
    else
      puts 'Invalid choice. Please try again.'
      create_person_prompt
    end
  end

  def create_teacher
    print 'Enter age: '
    age = gets.chomp.to_i
    print 'Enter specialization: '
    specialization = gets.chomp
    print 'Enter name (press Enter for Unknown): '
    name = gets.chomp
    print 'Does the teacher have parent permission? (true/false, press Enter for true): '
    parent_permission = gets.chomp.downcase != 'false'

    teacher = Teacher.new(age, specialization, name: name, parent_permission: parent_permission)
    @people << teacher
    puts "#{teacher.correct_name} has been created with ID #{teacher.id}."
  end

  def create_student
    print 'Enter age: '
    age = gets.chomp.to_i
    print 'Enter name (press Enter for Unknown): '
    name = gets.chomp
    print 'Does the student have parent permission? (true/false, press Enter for true): '
    parent_permission = gets.chomp.downcase != 'false'

    student = Student.new(age, nil, name: name, parent_permission: parent_permission)
    @people << student
    puts "#{student.correct_name} has been created with ID #{student.id}."
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "#{book.title} by #{book.author} has been added to the library."
  end

  def create_rental(date, person_id, book_title)
    person = find_person_by_id(person_id)
    book = find_book_by_title(book_title)

    if person && book
      rental = Rental.new(date, person, book)
      @rentals << rental
      puts "Rental created on #{date} for #{person.correct_name} and #{book.title}."
    else
      puts 'Person or book not found.'
    end
  end

  def list_rentals_for_person(person_id)
    person = find_person_by_id(person_id)

    if person
      puts "Rentals for #{person.correct_name}:"
      person.rentals.each { |rental| puts "#{rental.book.title} on #{rental.date}" }
    else
      puts 'Person not found.'
    end
  end

  private

  def find_person_by_id(id)
    @people.find { |person| person.id == id }
  end

  def find_book_by_title(title)
    @books.find { |book| book.title == title }
  end
end

# Main program
library_app = LibraryApp.new

loop do
  puts "\nLibrary Management System"
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
  puts '7. Exit'

  print 'Enter your choice: '
  choice = gets.chomp.to_i

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
    print 'Enter rental date: '
    date = gets.chomp
    print 'Enter person ID: '
    person_id = gets.chomp.to_i
    print 'Enter book title: '
    book_title = gets.chomp
    library_app.create_rental(date, person_id, book_title)
  when 6
    print 'Enter person ID: '
    person_id = gets.chomp.to_i
    library_app.list_rentals_for_person(person_id)
  when 7
    break
  else
    puts 'Invalid choice. Please try again.'
  end
end
