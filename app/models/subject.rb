class Subject < ApplicationRecord
  has_many :subjects_teacher
  has_many :teachers, through: :subjects_teacher
end
