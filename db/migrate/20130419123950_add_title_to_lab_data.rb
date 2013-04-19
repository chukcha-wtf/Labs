class AddTitleToLabData < ActiveRecord::Migration
  def change
    add_column :lab_data, :title, :string
  end
end
