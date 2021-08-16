class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.references :home_team, null: false, index: true, foreign_key: { to_table: :teams }
      t.references :away_team, null: false, index: true, foreign_key: { to_table: :teams }
      t.date :game_date, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
