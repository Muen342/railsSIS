class Aattendance < ApplicationRecord
  belongs_to :courses
  belongs_to :teacher
end
