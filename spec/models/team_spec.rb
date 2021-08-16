require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:team) { create(:team) }

  describe 'valid factory' do
    it { expect(team).to be_valid }
  end

  describe 'associations' do
    it { should have_many(:picks) }
  end
end
