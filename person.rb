# person.rb
require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []  # Initialize an empty array to store rentals
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  # Method to add a rental to the person
  def add_rental(rental)
    @rentals << rental
    rental.person = self  # Set the person for the rental
  end

  private

  def of_age?
    @age >= 18
  end
end
