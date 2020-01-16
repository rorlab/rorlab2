class AddDescriptionToRcables < ActiveRecord::Migration[6.0]
  def change
    add_column :rcables, :description, :text
  end
end
