class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :congressional_vote_id
      t.string :bill_title
      t.string :vote_cast
      t.integer :sponsor_id
      t.belongs_to :politician 
      
      t.timestamps
    end
  end
end
