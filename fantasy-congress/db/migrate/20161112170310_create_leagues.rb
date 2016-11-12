class CreateLeagues < ActiveRecord::Migration[5.0]
  def change
    create_table :leagues do |t|
      t.string :name
      t.datetime :draft_date
      
      t.timestamps
    end
  end
end
