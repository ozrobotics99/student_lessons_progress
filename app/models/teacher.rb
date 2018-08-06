class Teacher < ApplicationRecord
  validates :first_name, length: { maximum: 100 }, presence: true
  validates :last_name, length: { maximum: 100 }, presence: true

  has_many :enrolments
  has_many :students, through: :enrolments

  def fullname
    return first_name + ' ' + last_name
  end
end
