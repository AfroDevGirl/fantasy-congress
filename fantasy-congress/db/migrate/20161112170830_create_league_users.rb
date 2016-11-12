class CreateLeagueUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :league_users do |t|
      t.references :user, foreign_key: true
      t.references :league, foreign_key: true
      
      t.timestamps
    end
  end
end
