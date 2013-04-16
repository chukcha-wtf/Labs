class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.integer :lab_work_id

      t.timestamps
    end
  end
end
