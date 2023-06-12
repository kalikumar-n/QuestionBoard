require 'rails_helper'

RSpec.describe User, type: :model do
  it {should have_secure_password}
  let!(:active_user) { create_list(:user, 3, active: true) }
  attrs = attributes_for(:user)

  context 'Validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:email)}
    it { should validate_uniqueness_of(:email)}
  end

  context 'Scopes' do
    it { expect(User.active.length).to eq(3)}
  end
end
