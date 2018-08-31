class AddLeagueReferenceToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_reference :players, :league, index: true
  end
end
