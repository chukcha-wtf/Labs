class AddWrightAnswerFieldToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :wright_answer, :boolean, default: false
  end
end
