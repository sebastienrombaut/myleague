class Player < ApplicationRecord
  belongs_to :league

  validate :forbid_two_same_names_in_a_league

  validates :name, presence: true, length: { minimum: 2 }

  def matches
    Match.where(player1_id: id).or(Match.where(player2_id: id))
  end

  def matches_against_player_in_league(league_id, player_id)
    (matches.where(league_id: league_id).where(player1_id: player_id) + matches.where(league_id: league_id).where(player2_id: player_id)).uniq
  end

  def forbid_two_same_names_in_a_league
    Player.find_each do |player|
      if name == player.name && league_id == player.league_id
        errors.add(:name, "is already taken for this league")
      end
    end
  end

  def total_victories
    i = 0
    matches.each do |match|
      if match.winner == self
        i += 1
      end
    end
    i
  end

  def total_victories_for_a_league(league_id)
    i = 0
    matches.where(league_id: league_id).find_each do |match|
      if match.winner == self
        i += 1
      end
    end
    i
  end

  def total_victories_for_a_league_against_a_player(league_id, player_id)
    i = 0
    matches_against_player_in_league(league_id, player_id).each do |match|
      if match.winner == self
        i += 1
      end
    end
    i
  end

  def total_defeats
    j = 0
    matches.each do |match|
      if match.loser == self
        j += 1
      end
    end
    j
  end

  def total_defeats_for_a_league(league_id)
    i = 0
    matches.where(league_id: league_id).find_each do |match|
      if match.loser == self
        i += 1
      end
    end
    i
  end

  def total_defeats_for_a_league_against_a_player(league_id, player_id)
    i = 0
    matches_against_player_in_league(league_id, player_id).each do |match|
      if match.loser == self
        i += 1
      end
    end
    i
  end

  def total_draws
    k = 0
    matches.each do |match|
      if match.tie == true
        k += 1
      end
    end
    k
  end

  def total_draws_for_a_league(league_id)
    k = 0
    matches.where(league_id: league_id).find_each do |match|
      if match.tie == true
        k += 1
      end
    end
    k
  end

  def total_draws_for_a_league_against_a_player(league_id, player_id)
    i = 0
    matches_against_player_in_league(league_id, player_id).each do |match|
      if match.tie == true
        i += 1
      end
    end
    i
  end

  def ratio_calculation_for_a_league(league_id)
    unless matches.where(league_id: league_id).count == 0
      ratio = (total_victories_for_a_league(league_id) * 100) / matches.where(league_id: league_id).count
    end
    ratio.to_f
  end

  def self.array_of_ratios(players, league)
    @ratios = {}
    players.find_each do |player|
      @ratios[player.id.to_s.to_sym] = player.ratio_calculation_for_a_league(league)
    end
    @ratios.sort_by{ |_key, value| value }.reverse.to_h
  end
end
