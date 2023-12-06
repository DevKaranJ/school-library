# book.rb
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # Method to add a rental to the book
  def add_rental(rental)
    @rentals << rental
    rental.book = self
  end

  # Define a setter method for book
  def book=(new_book)
    @book = new_book
  end
end
