# person_spec.rb
require_relative '../person'
require_relative '../rental'

describe Person do
  let(:person_name) { 'John Doe' }
  let(:person_age) { 25 }
  let(:parent_permission) { true }
  let(:person) { Person.new(person_age, name: person_name, parent_permission: parent_permission) }

  it 'has a name, age, and parent permission' do
    expect(person.name).to eq(person_name)
    expect(person.age).to eq(person_age)
    expect(person.instance_variable_get(:@parent_permission)).to eq(parent_permission)
  end

  it 'has a unique ID' do
    expect(person.id).to be_a(Integer)
  end

  it 'starts with an empty list of rentals' do
    expect(person.rentals).to be_empty
  end

  it 'can use services if of age or with parent permission' do
    expect(person.can_use_services?).to be_truthy
  end

  it 'cannot use services without parent permission if under 18' do
    underage_person = Person.new(16, name: 'Underage Person', parent_permission: false)
    expect(underage_person.can_use_services?).to be_falsey
  end

  it 'correctly returns the name' do
    expect(person.correct_name).to eq(person_name)
  end

  it 'can add a rental' do
    rental = Rental.new('2023-01-01', person, Book.new('Book Title', 'Author'))
    person.add_rental(rental)
    expect(person.rentals).to include(rental)
    expect(rental.person).to eq(person)
  end
end
