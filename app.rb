# app.rb
require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'
require_relative 'library_menu'
require_relative 'library_user_input'

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

  def list_books_with_index
    puts 'List of all books with index:'
    @books.each_with_index { |book, index| puts "#{index + 1}. #{book.title} by #{book.author}" }
  end

  def list_people_with_index
    puts 'List of all people with index:'
    @people.each_with_index do |person, index|
      puts "#{index + 1}. #{person.correct_name} (ID: #{person.id}, Age: #{person.age})"
    end
  end

  def create_person_prompt
    LibraryMenu.display_create_person_options

    choice = LibraryUserInput.get_choice
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
    age = LibraryUserInput.get_integer('Enter age')
    specialization = LibraryUserInput.get_string('Enter specialization')
    name = LibraryUserInput.get_string('Enter name (press Enter for Unknown)')
    parent_permission = LibraryUserInput.get_boolean('Does the teacher have parent permission?')

    teacher = Teacher.new(age, specialization, name: name, parent_permission: parent_permission)
    @people << teacher
    puts "#{teacher.correct_name} has been created with ID #{teacher.id}."
  end

  def create_student
    age = LibraryUserInput.get_integer('Enter age')
    name = LibraryUserInput.get_string('Enter name (press Enter for Unknown)')
    parent_permission = LibraryUserInput.get_boolean('Does the student have parent permission?')

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

  def create_rental_with_indices
    list_people_with_index
    person_index = LibraryUserInput.get_integer('Enter the index of the person') - 1

    list_books_with_index
    book_index = LibraryUserInput.get_integer('Enter the index of the book') - 1

    person_id = @people[person_index]&.id
    book_title = @books[book_index]&.title

    if person_id && book_title
      date = LibraryUserInput.get_date('Enter rental date')
      create_rental(date, person_id, book_title)
    else
      puts 'Invalid person or book index. Please try again.'
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
