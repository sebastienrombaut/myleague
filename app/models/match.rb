class Match < ApplicationRecord
  belongs_to :league
  
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
