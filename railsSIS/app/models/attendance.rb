class Attendance < ApplicationRecord
  belongs_to :courses
  belongs_to :sstudent
end
