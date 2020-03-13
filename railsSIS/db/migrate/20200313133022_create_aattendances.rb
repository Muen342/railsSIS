class CreateAattendances < ActiveRecord::Migration[5.2]
  def change
    create_table :aattendances do |t|
      t.date :date
      t.references :courses, foreign_key: true
      t.references :teacher, foreign_key: true
      t.string :student

      t.timestamps
    end
  end
end
