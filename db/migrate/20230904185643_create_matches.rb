class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.string :team_1
      t.string :team_2
      t.integer :score_1
      t.integer :score_2
      t.string :winner
      t.integer :score_winner

      t.timestamps
    end
  end
end
