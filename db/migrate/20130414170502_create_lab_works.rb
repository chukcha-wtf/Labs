class CreateLabWorks < ActiveRecord::Migration
  def change
    create_table :lab_works do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
