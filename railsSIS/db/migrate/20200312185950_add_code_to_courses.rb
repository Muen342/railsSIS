class AddCodeToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :code, :string
  end
end
