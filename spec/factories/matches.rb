# == Schema Information
#
# Table name: matches
#
#  id         :integer          not null, primary key
#  league_id  :integer
#  comment    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  score1     :integer
#  score2     :integer
#  player1_id :integer
#  player2_id :integer
#

FactoryBot.define do
  factory :match do
    league_id { League.first }
    score1 1
    score2 1
  end
end
