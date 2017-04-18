class CreateTools < ActiveRecord::Migration[5.0]
  def change
    create_table :tools do |t|
      t.string :title
      t.integer :quantity

      t.timestamps
    end
  end
end
