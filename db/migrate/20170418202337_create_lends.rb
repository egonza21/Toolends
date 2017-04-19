class CreateLends < ActiveRecord::Migration[5.0]
  def change
    create_table :lends do |t|
      t.references :tool, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
