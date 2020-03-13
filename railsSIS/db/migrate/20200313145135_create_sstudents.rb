class CreateSstudents < ActiveRecord::Migration[5.2]
  def change
    create_table :sstudents, :id => false do |t|
      t.integer :id, primary: true
      t.string :name
      t.string :surname
      t.integer :grade
  
      t.timestamps
     end
    execute %Q{ ALTER TABLE `bronte_db`.`sstudents` CHANGE COLUMN `id` `id` INT(11) NOT NULL , ADD PRIMARY KEY (`id`); }
  end
 end
 