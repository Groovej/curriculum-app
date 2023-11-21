class Teacher < ApplicationRecord
  has_many :sections
  has_many :subjects_teacher
  has_many :subjects, -> { distinct }, through: :subjects_teacher

  def full_name
    "#{first_name} #{last_name}"
  end
end
