class CreateLabData < ActiveRecord::Migration
  def change
    create_table :lab_data do |t|
      t.integer :lab_work_id

      t.timestamps
    end
  end
end
