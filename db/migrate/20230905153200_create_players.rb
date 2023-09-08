class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :fullname
      t.integer :age
      t.string :post
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
