class CreateLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :sport

      t.timestamps
    end
  end
end
