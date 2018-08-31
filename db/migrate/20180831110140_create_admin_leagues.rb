class CreateAdminLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_leagues do |t|
      t.references :admin, foreign_key: true
      t.references :league, foreign_key: true

      t.timestamps
    end
  end
end
