class Progress < ApplicationRecord
  validates :lesson_id, presence: true
  validates :student_id, presence: true

  belongs_to :lesson
  belongs_to :student
end
