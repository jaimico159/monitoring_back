class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :engineer, null: false, foreign_key: true
      t.references :time_slot, null: false, foreign_key: true
      t.datetime :completed_at

      t.timestamps
    end
  end
end
