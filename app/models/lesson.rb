class Lesson < ApplicationRecord
  validates :number, presence: true
  validates :part_number, presence: true

  has_many :progresses

  def name
    return "Lesson #{number}, part #{part_number}"
  end
end
