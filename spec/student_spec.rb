require_relative '../student'
require_relative '../classroom'

describe Student do
  let(:student_name) { 'unknown' }
  let(:student_age) { 16 }
  let(:parent_permission) { false }
  let(:some_classroom_instance) { Classroom.new('Math') }

  describe '#initialize' do
    it 'creates a student with the specified name and age' do
      student = Student.new(student_age, some_classroom_instance, name: student_name,
                                                                  parent_permission: parent_permission)
      expect(student.name).to eq(student_name)
      expect(student.age).to eq(student_age)
    end

    it 'creates a student with default values if optional parameters are not provided' do
      student = Student.new(student_age, some_classroom_instance)
      expect(student.name).to eq('Unknown')
      expect(student.age).to eq(student_age)
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the student is of age' do
      student = Student.new(18, some_classroom_instance)
      expect(student.can_use_services?).to be true
    end

    it 'returns true if the student has parent permission' do
      student = Student.new(16, some_classroom_instance, name: 'Bob', parent_permission: true)
      expect(student.can_use_services?).to be true
    end

    it 'returns false if the student is under age and has no parent permission' do
      student = Student.new(15, some_classroom_instance, name: 'Bob', parent_permission: false)
      expect(student.can_use_services?).to be false
    end
  end

  describe '#add_classroom' do
    it 'adds a classroom to the student' do
      student = Student.new(student_age, some_classroom_instance, name: student_name,
                                                                  parent_permission: parent_permission)
      expect(student.classroom).to eq(some_classroom_instance)
    end
  end

  describe '#play_hooky' do
    it 'returns a random string' do
      student = Student.new(student_age, some_classroom_instance, name: student_name,
                                                                  parent_permission: parent_permission)
      expect(student.play_hooky).to be_a(String)
    end
  end
end
