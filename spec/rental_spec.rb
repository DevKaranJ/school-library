# rental_spec.rb
require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  let(:person) { Person.new(25, name: 'John Doe', parent_permission: true) }
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:rental_date) { '2023-01-01' }
  let(:rental) { Rental.new(rental_date, person, book) }

  it 'has a date, person, and book' do
    expect(rental.date).to eq(rental_date)
    expect(rental.person).to eq(person)
    expect(rental.book).to eq(book)
  end

  it 'adds itself to the person and book rentals lists' do
    expect(person.rentals).to include(rental)
    expect(book.rentals).to include(rental)
  end

  context 'when creating a rental' do
    it 'associates the rental with the person and book' do
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
    end

    it 'adds the rental to the person and book rentals lists' do
      expect(person.rentals).to include(rental)
      expect(book.rentals).to include(rental)
    end
  end
end
