class CreateValidationCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :validation_codes do |t|
      t.string :phone
      t.string :code
      t.boolean :is_used, default: false
      t.datetime :used_at
      t.timestamps
    end
  end
end
