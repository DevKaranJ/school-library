require_relative '../classroom'
require_relative '../student'

describe Classroom do
  describe '#initialize' do
    it 'creates a classroom with the specified label' do
      classroom = Classroom.new('Math')
      expect(classroom.label).to eq 'Math'
    end

    it 'creates a classroom with default values if optional parameters are not provided' do
      classroom = Classroom.new('Math')
      expect(classroom.label).to eq 'Math'
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom = Classroom.new('Math')
      student = Student.new(17, nil, name: 'Bob')
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
