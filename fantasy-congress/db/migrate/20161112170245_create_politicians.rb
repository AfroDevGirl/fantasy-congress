class CreatePoliticians < ActiveRecord::Migration[5.0]
  def change
    create_table :politicians do |t|
      t.boolean :current, null: false
      t.string :end_date
      t.string :party, null: false
      t.string :first_name, null: false
      t.string :gender
      t.integer :photo_id, null: false
      t.string :last_name, null: false
      t.string :middle_name
      t.string :twitter_id
      t.string :role_type
      t.string :senator_rank
      t.string :start_date, null: false
      t.string :state, null: false
      t.string :title
      
      t.timestamps
    end
  end
end
