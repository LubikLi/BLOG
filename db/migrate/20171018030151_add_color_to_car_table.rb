class AddColorToCarTable < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :color, :string
  end
end
