class CreatePicks < ActiveRecord::Migration[6.1]
  def change
    create_table :picks do |t|
      t.references :match_question,  null: false
      t.references :user,            null: false
      t.references :team,            null: false
      t.boolean    :result,          null: true , default: nil
      t.timestamps
    end
  end
end
