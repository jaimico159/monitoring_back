class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.integer :slot_duration
      t.integer :contract_duration
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
