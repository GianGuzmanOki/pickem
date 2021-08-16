class AddDefaultQuestionToMatch < ActiveRecord::Migration[6.1]
  def change
    add_column :match_questions, :default_question, :boolean, null: false, default: false
  end
end
