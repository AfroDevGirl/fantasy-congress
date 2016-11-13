class CreatePoliticians < ActiveRecord::Migration[5.0]
  def change
    create_table :politicians do |t|
      t.boolean :current
      t.string :end_date
      t.string :party
      t.string :first_name
      t.string :gender
      t.integer :photo_id, null: false
      t.string :last_name
      t.string :middle_name
      t.string :twitter_id
      t.string :role_type
      t.string :senator_rank
      t.string :start_date
      t.string :state
      t.string :title
      
      t.timestamps
    end
  end
end
