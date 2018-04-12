class AddScoreToMatch < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :score1, :integer
    add_column :matches, :score2, :integer
  end
end
