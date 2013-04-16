class AddDataToLabData < ActiveRecord::Migration
  def change
    add_column :lab_data, :data, :string
  end
end
