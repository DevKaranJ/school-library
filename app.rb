# app.rb
require_relative 'person'
require_relative 'book'
require_relative 'rental'

class LibraryApp
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    puts "List of all books:"
    @books.each { |book| puts "#{book.title} by #{book.author}" }
  end

  def list_all_people
    puts "List of all people:"
    @people.each { |person| puts "#{person.correct_name} (ID: #{person.id}, Age: #{person.age})" }
  end

  def create_person(age, name = 'Unknown', parent_permission = true)
    person = Person.new(age, name: name, parent_permission: parent_permission)
    @people << person
    puts "#{person.correct_name} has been created with ID #{person.id}."
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
      puts "Person or book not found."
    end
  end

  def list_rentals_for_person(person_id)
    person = find_person_by_id(person_id)

    if person
      puts "Rentals for #{person.correct_name}:"
      person.rentals.each { |rental| puts "#{rental.book.title} on #{rental.date}" }
    else
      puts "Person not found."
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
