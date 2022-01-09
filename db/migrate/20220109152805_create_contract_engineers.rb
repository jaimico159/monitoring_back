class CreateContractEngineers < ActiveRecord::Migration[7.0]
  def change
    create_table :contract_engineers do |t|
      t.references :engineer, null: false, foreign_key: true
      t.references :contract, null: false, foreign_key: true

      t.timestamps
    end
  end
end
