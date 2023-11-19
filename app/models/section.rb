class Section < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject
  belongs_to :classroom
  has_and_belongs_to_many :students

  DURATIONS = [50, 80].freeze
  DAYS_OF_WEEK = {
    monday: '1',
    tuesday: '2',
    wednesday: '3',
    thursday: '4',
    friday: '5'
  }.freeze

  validates :days_of_week, presence: true
  validates :duration, presence: true, inclusion: { in: DURATIONS }
  validates_time :start_time, between: ['7:30am', '10:00pm']

  after_validation :set_end_time

  def assign_days_of_week=(days)
    self[:days_of_week] = days.map { |day| DAYS_OF_WEEK[day.intern] }
  end

  def days_of_week_presenter
    days_of_week.map { |item| DAYS_OF_WEEK.invert[item].capitalize }.join(', ')
  end

  private

  def set_end_time
    self.end_time = start_time + duration.minutes
  end
end
