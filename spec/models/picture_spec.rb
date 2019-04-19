require 'rails_helper'

RSpec.describe Picture, type: :model do
  subject(:picture) { build :picture }
  context 'Test Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:thumbnail_url) }
  end
end
