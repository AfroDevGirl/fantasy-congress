class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.references :player_a, references: :users
      t.references :player_b, references: :users
      t.integer :player_a_points, default: 0
      t.integer :player_b_points, default: 0
      
      t.timestamps
    end
  end
end
