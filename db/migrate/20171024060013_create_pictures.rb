class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    suppress_messages do
      create_table :pictures do |t|
        t.string :height
        t.string :width
        t.string :url
        t.timestamps
      end
    end
  end
end
