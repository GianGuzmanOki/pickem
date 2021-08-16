class CreateMatchQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :match_questions do |t|
      t.references :match,      null: false
      t.string     :question,   null: false
      t.references :winner,     foreign_key: { to_table: :teams }
      t.timestamps
    end
  end
end
