# == Schema Information
#
# Table name: leagues
#
#  id         :integer          not null, primary key
#  name       :string
#  sport      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class League < ApplicationRecord
  has_many :admin_leagues, dependent: :destroy
  has_many :admins, through: :admin_leagues
  has_many :matches, dependent: :destroy
  has_many :players, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :sport, presence: true, length: { minimum: 2 }

  def player(id)
    Player.find(id)
  end

  def matches
    Match.where(league_id: id)
  end
end
