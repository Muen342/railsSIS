class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.date :date
      t.string :attendance
      t.bigint :course_id
      t.bigint :student_id

      t.timestamps
    end
  end
end
