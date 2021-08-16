require 'rails_helper'

RSpec.describe MatchQuestion, type: :model do
  let(:match_question) { create(:match_question) }

  describe 'valid factory' do
    it { expect(match_question).to be_valid }
  end

  describe 'associations' do
    it { should belong_to(:match) }
    it { should belong_to(:winner).optional }
    it { should have_many(:picks) }
  end
end
