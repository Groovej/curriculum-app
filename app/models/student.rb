class Student < ApplicationRecord
  has_and_belongs_to_many :sections

  validate :check_intersections

  def check_intersections
    return if sections.empty? || sections.size == 1

    sections.each do |section|
      days_overlaps = sections
                        .where.not(id: section.id)
                        .where('days_of_week @> ARRAY[?]::varchar[]', section.days_of_week)
                        .exists?


      if days_overlaps
        existed = sections
                    .where.not(id: section.id)
                    .where('start_time < ? AND end_time > ?', section.end_time, section.start_time)
                    .exists?
      end

      if existed
        errors.add(:base, 'You can not visit sections what overlaps. Choose different.')
        break
      end
    end
  end
end
