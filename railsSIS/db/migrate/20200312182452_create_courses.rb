class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.string :teacher
      t.float :credits
      t.string :students

      t.timestamps
    end
  end
end
