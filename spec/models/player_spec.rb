require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "forbid_two_same_names_in_a_league" do
    subject { FactoryBot.build :player }

    context 'when there is already a player in the league' do
      let(:player1) { create(:player) }

      subject.name = player1.name
      subject.league = player1.league

      expect(subject).to_not be_valid
    end
  end
end
