class AddPlayersToMatch < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :player1_id, :integer
    add_column :matches, :player2_id, :integer
  end
end
