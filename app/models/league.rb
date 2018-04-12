class League < ApplicationRecord
  has_and_belongs_to_many :players

  validates :name, presence: true, length: { minimum: 2 }
  validates :sport, presence: true, length: { minimum: 2 }

  def player(id)
  	return Player.find(id)
  end

  def matches
  	return Match.where(league_id: self.id)
  end

end
