class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :leagues

  validates :name, presence: true, length: { minimum: 2 }

  def matches
  	return Match.where(player1_id: self.id).or(Match.where(player2_id: self.id))
  end

#  def leagues
#  	return League.where(id: )
#  end

  def total_victories
  	i = 0
  	self.matches.each do |match|
      if match.winner == self
      	i +=1
      end
    end 
  return i
  end

  def total_defeats
  	j = 0
  	self.matches.each do |match|
  		if match.loser == self
  		  j +=1
  		end
  	end
  return j
  end

  def total_draws
    k = 0
    self.matches.each do |match|
      if match.tie == true
      	k += 1
      end
    end
  return k
  end

end
