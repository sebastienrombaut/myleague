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

class Match < ApplicationRecord
  belongs_to :league

  validate :check_player1_player2_are_different

  validates :player1_id, :player2_id, :score1, :score2, presence: true, numericality: { only_integer: true }

  scope :recent_sort, -> { order(created_at: :desc) }

  def check_player1_player2_are_different
    errors.add(:player1_id, "the players must be different") if player1_id == player2_id
  end

  def player(id)
    Player.find(id)
  end

  def winner
    if score1 < score2
      player(player2_id)
    elsif score2 < score1
      player(player1_id)
    end
  end

  def loser
    if score1 < score2
      player(player1_id)
    elsif score2 < score1
      player(player2_id)
    end
  end

  def tie
    score1 == score2
  end
end
