class Lesson < ApplicationRecord
  validates :number, length: { maximum: 3 }, presence: true
  validates :part_number, length: { maximum: 1 }, presence: true

  has_many :progresses

  #format lesson text
  def name
    return "Lesson #{number}, part #{part_number}"
  end

  #function returns next Lesson in order, cannot return after last lesson
  def next(lesson)
    next_id = lesson.id + 1
    last_id = Lesson.last.id
    unless next_id <= last_id
      next_id = last_id
    end
    next_lesson = Lesson.find(next_id)
    return next_lesson
  end
end
