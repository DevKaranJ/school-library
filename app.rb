# app.rb
require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'
require_relative 'library_menu'
require_relative 'library_user_input'
require 'json'

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

    choice = LibraryUserInput.choice
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

    # Explicitly pass id: nil to the Teacher constructor
    teacher = Teacher.new(age, specialization, name: name, parent_permission: parent_permission, id: nil)
    @people << teacher
    puts "#{teacher.correct_name} has been created with ID #{teacher.id}."
  end

  def create_student
    age = LibraryUserInput.get_integer('Enter age')
    name = LibraryUserInput.get_string('Enter name (press Enter for Unknown)')
    parent_permission = LibraryUserInput.get_boolean('Does the student have parent permission?')

    student = Student.new(age, nil, name: name, parent_permission: parent_permission, id: nil)
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

  def find_book_by_title(title)
    @books.find { |book| book.title == title }
  end

  def find_person_by_id(id)
    @people.find { |person| person.id == id }
  end

  def save_data
    save_books
    save_people
    save_rentals
  end

  def load_data
    load_books
    load_people
    load_rentals
  end

  private

  def save_books
    books_json = @books.map do |book|
      {
        title: book.title,
        author: book.author
      }
    end
    File.write('./books.json', JSON.generate(books_json))
  end

  def load_books
    File.exist?('./books.json') ? books_json = JSON.parse(File.read('books.json')) : return
    @books = books_json.map do |book|
      Book.new(book['title'], book['author'])
    end
  end

  def save_people
    people_json = @people.map do |person|
      {
        type: person.class.name,
        id: person.id,
        name: person.name,
        age: person.age,
        parent_permission: person.respond_to?(:parent_permission) ? person.parent_permission : nil,
        specialization: person.respond_to?(:specialization) ? person.specialization : nil
      }
    end
    File.write('./people.json', JSON.generate(people_json))
  end

  def load_people
    filename = './people.json'
    return unless File.exist?(filename)

    people_json = JSON.parse(File.read(filename))
    @people = people_json.map do |person|
      if person['type'] == 'Teacher'
        Teacher.new(person['age'], person['specialization'], name: person['name'],
                                                             parent_permission: person['parent_permission'],
                                                             id: person['id'])
      elsif person['type'] == 'Student'
        Student.new(person['age'], nil, name: person['name'],
                                        parent_permission: person['parent_permission'], id: person['id'])
      else
        Person.new(person['age'], name: person['name'], parent_permission: person['parent_permission'],
                                  id: person['id'])
      end
    end
  end

  def save_rentals
    rentals_json = @rentals.map do |rental|
      {
        date: rental.date,
        person_id: rental.person.id,
        book_title: rental.book.title
      }
    end
    File.write('./rentals.json', JSON.generate(rentals_json))
  end

  def load_rentals
    filename = './rentals.json'
    return unless File.exist?(filename)

    rentals_json = JSON.parse(File.read(filename))
    @rentals = rentals_json.map do |rental|
      person_id = rental['person_id']
      book_title = rental['book_title']
      person = find_person_by_id(person_id)

      if person.nil?
        puts "Person not found for ID: #{person_id}"
        puts "Available person IDs: #{@people.map(&:id)}"
      end

      book = find_book_by_title(book_title)
      Rental.new(rental['date'], person, book)
    end
  end

  def load_data_from_file(filename)
    return nil unless File.exist?(filename)

    JSON.parse(File.read(filename), symbolize_names: true)
  end
end
