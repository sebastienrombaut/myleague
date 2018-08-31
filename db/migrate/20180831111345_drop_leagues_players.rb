class DropLeaguesPlayers < ActiveRecord::Migration[5.1]
  def change
    drop_table :leagues_players
  end
end
