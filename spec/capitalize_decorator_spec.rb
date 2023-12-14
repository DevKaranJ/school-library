require_relative '../capitalize_decorator'
require_relative '../person'

describe CapitalizeDecorator do
  let(:person_name) { 'maximilianus' }
  let(:person_age) { 25 }
  let(:parent_permission) { true }
  let(:person) { Person.new(person_age, name: person_name, parent_permission: parent_permission) }
  let(:decorator) { CapitalizeDecorator.new(person) }

  it 'has a correct name' do
    expect(decorator.correct_name).to eq(person_name.capitalize)
  end

  it 'delegates age and can_use_services?' do
    expect(decorator.instance_variable_get(:@nameable).age).to eq(person_age)
    expect(decorator.instance_variable_get(:@nameable).can_use_services?).to eq(true)
  end
end
