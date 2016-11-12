class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.string :bill_type_label
      t.string :current_status
      t.string :current_status_date
      t.string :congress_number
      t.string :introduced_date
      t.references :politician, foreign_key: true
      t.string :bill_number
      t.boolean :is_alive
      t.boolean :is_current

      t.timestamps
    end
  end
end
