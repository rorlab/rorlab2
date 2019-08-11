class CreateRblogs < ActiveRecord::Migration[6.0]
  def change
    create_table :rblogs do |t|
      t.string :title
      t.text :content
      t.references :writer, foreign_key: { to_table: :users}
      t.boolean :shared

      t.timestamps
    end
  end
end
