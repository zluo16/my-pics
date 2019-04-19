require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build :user }
  context 'Test Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username).case_insensitive }
  end
end
