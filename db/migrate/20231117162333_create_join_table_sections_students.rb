class CreateJoinTableSectionsStudents < ActiveRecord::Migration[7.1]
  def change
    create_join_table :sections, :students do |t|
      # t.index [:subject_id, :student_id]
      # t.index [:student_id, :subject_id]
    end
  end
end
