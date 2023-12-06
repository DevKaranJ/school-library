# rental.rb
class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book

    # Set the person and book for the rental
    person.add_rental(self)
    book.add_rental(self)
  end

  # Define a setter method for person
  def person=(new_person)
    @person = new_person
  end

  # Define a setter method for book
  def book=(new_book)
    @book = new_book
  end
end
