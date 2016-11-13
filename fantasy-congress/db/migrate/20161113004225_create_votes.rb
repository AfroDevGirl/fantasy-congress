class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :congressional_vote_id
      
      t.timestamps
    end
  end
end
