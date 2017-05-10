class AddStudentIfToLends < ActiveRecord::Migration[5.0]
  def change
    add_reference :lends, :student, foreign_key: true
  end
end
