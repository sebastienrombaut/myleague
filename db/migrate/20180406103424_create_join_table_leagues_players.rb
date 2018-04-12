class CreateJoinTableLeaguesPlayers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :leagues, :players do |t|
      # t.index [:league_id, :player_id]
      # t.index [:player_id, :league_id]
    end
  end
end
