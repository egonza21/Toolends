class CreateLendTools < ActiveRecord::Migration[5.0]
  def change
    create_table :lend_tools do |t|
      t.integer :amount
      t.references :tool, foreign_key: true
      t.references :lend, foreign_key: true

      t.timestamps
    end
  end
end
