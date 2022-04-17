class CreateDreams < ActiveRecord::Migration[7.0]
  def change
    create_table :dreams do |t|
      t.string :title
      t.boolean :nightmare
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
