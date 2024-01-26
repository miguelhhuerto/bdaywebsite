class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :pictures do |t|
      t.string :image
      t.string :author
      t.text :caption
      t.timestamps
    end
  end
end
