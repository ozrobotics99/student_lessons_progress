class Lesson < ApplicationRecord
  validates :number, length: { maximum: 3 }, presence: true
  validates :part_number, length: { maximum: 1 }, presence: true

  has_many :progresses

  def name
    return "Lesson #{number}, part #{part_number}"
  end
end
