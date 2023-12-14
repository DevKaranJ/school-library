# nameable_spec.rb

require_relative '../nameable'

class TestNameable < Nameable
  def correct_name
    'John Doe'
  end
end

RSpec.describe Nameable do
  let(:nameable_instance) { TestNameable.new }

  describe '#correct_name' do
    it 'raises NotImplementedError for the base class' do
      expect { subject.correct_name }.to raise_error(NotImplementedError, 'Subclasses must implement this method')
    end

    it 'returns the correct name for the subclass' do
      expect(nameable_instance.correct_name).to eq('John Doe')
    end
  end
end
