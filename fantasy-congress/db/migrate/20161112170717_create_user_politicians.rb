class CreateUserPoliticians < ActiveRecord::Migration[5.0]
  def change
    create_table :user_politicians do |t|
      t.string :team_name
      t.references :user, foreign_key: true
      t.references :politician, foreign_key: true
      
      t.timestamps
    end
  end
end
