class CreatePoliticianBills < ActiveRecord::Migration[5.0]
  def change
    create_table :politician_bills do |t|
      t.string :politician_role
      t.references :politician, foreign_key: true
      t.references :bill, foreign_key: true
      t.timestamps
    end
  end
end
