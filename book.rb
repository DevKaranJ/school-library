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

  # Used attr_writer to define the writer method for book
  attr_writer :book
end
