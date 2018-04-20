class Match < ApplicationRecord
  belongs_to :league
  
  validate :check_player1_player2_are_different

  validates :player1_id, :player2_id, :score1, :score2, presence: true, :numericality => {:only_integer => true}

  scope :recent_sort, -> { order(created_at: :desc) }
  
  def check_player1_player2_are_different
    errors.add(:player1_id, "the players must be different") if self.player1_id == self.player2_id
  end

  def player(id)
  	return Player.find(id)
  end

  def winner
  	if self.score1 < self.score2
  		return self.player(player2_id)
    elsif self.score2 < self.score1
    	return self.player(player1_id)
    else 
    	return nil		
  	end
  end

  def loser
  	if self.score1 < self.score2
  		return self.player(player1_id)
  	elsif self.score2 < self.score1
  		return self.player(player2_id)
  	else
  		return nil
  	end		
  end

  def tie
  	if self.score1 == self.score2
  		return true
  	else
  		return false
  	end
  end

end
