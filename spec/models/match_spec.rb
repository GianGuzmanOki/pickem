require 'rails_helper'

RSpec.describe Match, type: :model do
  let(:match) { create(:match) }

  describe 'valid factory' do
    it { expect(match).to be_valid }
  end

  describe 'associations' do
    it { should belong_to(:home_team) }
    it { should belong_to(:away_team) }
    it { should have_many(:match_questions) }
  end

  describe 'enum fields' do
    it { should define_enum_for(:status).with_values([ :pending, :finished ]) }
  end
end
