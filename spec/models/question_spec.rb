require 'rails_helper'

RSpec.describe Question, type: :model do
  subject(:question) {Question.new(title: 'Test')}

  context 'Validation' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end

  context 'Association' do
    it {should belong_to(:user)}
    it {should have_one_attached(:file)}
  end
end
