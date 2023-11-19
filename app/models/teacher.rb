class Teacher < ApplicationRecord
  has_many :sections
  has_and_belongs_to_many :subjects

  def full_name
    "#{first_name} #{last_name}"
  end
end
