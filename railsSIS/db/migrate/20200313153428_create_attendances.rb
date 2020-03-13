class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    # create_table :attendances do |t|
    #   t.date :date
    #   t.string :attendance
    #   t.references :courses, foreign_key: true
    #   t.references :sstudent, foreign_key: true

    #   t.timestamps
    # end
    execute %Q{
      CREATE TABLE `attendances` (`id` bigint NOT NULL AUTO_INCREMENT PRIMARY KEY, `date` date, `attendance` varchar(255), `courses_id` bigint, `sstudent_id` int(11), `created_at` datetime NOT NULL, `updated_at` datetime NOT NULL,  INDEX `index_attendances_on_courses_id`  (`courses_id`),  INDEX `index_attendances_on_sstudent_id`  (`sstudent_id`), CONSTRAINT `fk_rails_325add2ca9`
FOREIGN KEY (`courses_id`)
  REFERENCES `courses` (`id`)
, CONSTRAINT `fk_rails_2cf5ba2b39`
FOREIGN KEY (`sstudent_id`)
  REFERENCES `sstudents` (`id`)
)
    }
    # execute %Q{ ALTER TABLE `bronte_db`.`attendances` CHANGE COLUMN `sstudent_id` `id` INT(11) NOT NULL; }
  end
end
