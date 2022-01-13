class AddColorToEngineers < ActiveRecord::Migration[7.0]
  def change
    add_column :engineers, :color, :string
  end
end
