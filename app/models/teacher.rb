class Teacher < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :enrolments

  def name
    return first_name + ' ' + last_name
  end
end
