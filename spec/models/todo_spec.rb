require 'rails_helper'

RSpec.describe Todo, :type => :model do
  describe '#validation' do
    it { should validate_presence_of :what }
    it { should validate_presence_of :urgency }
    it { should validate_numericality_of :urgency }
    it { should validate_presence_of :priority }
    it { should validate_numericality_of :priority }
  end
end
