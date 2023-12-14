require_relative '../teacher'
require_relative '../trimmer_decorator'
require_relative '../capitalize_decorator'

describe Teacher do
  let(:teacher_name) { 'maximilianus' }
  let(:teacher_age) { 40 }
  let(:teacher_specialization) { 'Math' }
  let(:parent_permission) { true }
  let(:teacher) do
    Teacher.new(teacher_age, teacher_specialization,
                name: teacher_name, parent_permission: parent_permission)
  end

  it 'has a name, age, and parent permission' do
    expect(teacher.name).to eq(teacher_name)
    expect(teacher.age).to eq(teacher_age)
    expect(teacher.instance_variable_get(:@parent_permission)).to eq(parent_permission)
  end

  it 'has a unique ID' do
    expect(teacher.id).to be_a(Integer)
  end

  it 'assigns a specialized teacher' do
    expect(teacher.specialization).to eq(teacher_specialization)
  end

  it 'can use services if of age or with parent permission' do
    expect(teacher.can_use_services?).to be true
  end

  it 'correctly returns the name' do
    expect(teacher.correct_name).to eq(teacher_name)
  end

  it 'correctly returns trimmed name' do
    trimmed_teacher = TrimmerDecorator.new(teacher)

    allow(trimmed_teacher).to receive(:trimmed_name) { teacher_name[0..9] }

    expect(trimmed_teacher.trimmed_name).to eq(teacher_name[0..9])
  end

  it 'correctly returns capitalized name' do
    capitalized_teacher = CapitalizeDecorator.new(teacher)

    allow(capitalized_teacher).to receive(:capitalize_name) { teacher_name.capitalize }

    expect(capitalized_teacher.capitalize_name).to eq(teacher_name.capitalize)
  end
end
