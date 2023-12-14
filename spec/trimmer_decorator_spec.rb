# trimmer_decorator_spec.rb
require_relative '../trimmer_decorator'
require_relative '../person'

describe TrimmerDecorator do
  let(:person_name) { 'maximilianus' }
  let(:trimmed_name) { person_name[0..9] }
  let(:person_age) { 25 }
  let(:parent_permission) { true }
  let(:person) { Person.new(person_age, name: person_name, parent_permission: parent_permission) }
  let(:decorator) { TrimmerDecorator.new(person) }

  it 'has a correct name' do
    expect(decorator.correct_name).to eq(trimmed_name)
  end

  it 'delegates age and can_use_services?' do
    # Access age and check can_use_services? through @nameable
    expect(decorator.instance_variable_get(:@nameable).age).to eq(person_age)
    expect(decorator.instance_variable_get(:@nameable).can_use_services?).to eq(true)
  end
end
