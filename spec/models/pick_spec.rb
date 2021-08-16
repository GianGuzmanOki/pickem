require 'rails_helper'

RSpec.describe Pick, type: :model do
  let(:pick) { create(:pick) }

  describe 'valid factory' do
    it { expect(pick).to be_valid }
  end

  describe 'associations' do
    it { should belong_to(:match_question) }
    it { should belong_to(:user) }
    it { should belong_to(:team) }
  end
end
