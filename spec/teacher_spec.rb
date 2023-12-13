require_relative '../teacher'

describe Teacher do
  let(:teacher_name) { 'Alice' }
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

  it 'can use services if of age or with parent permission' do
    expect(teacher.can_use_services?).to be true
  end

  it 'correctly returns the name' do
    expect(teacher.correct_name).to eq(teacher_name)
  end
end
