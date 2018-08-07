require 'rails_helper'


RSpec.describe Lesson, :type => :model do

  #fail on no number part_number
  it "new lesson is valid" do
    expect(Lesson.new).not_to be_valid
  end

  context "check 2 or more lessons" do
    it "check names are correct" do
      lesson1 = Lesson.create!(:number => 1, :part_number => 3)
      lesson2 = Lesson.create!(:number => 2, :part_number => 4)
      expect(lesson1.number).to eq (1)
      expect(lesson1.part_number).to eq (3)
      expect(lesson2.number).to eq (2)
      expect(lesson2.part_number).to eq (4)
    end
  end

  #check associations
  context "check lesson" do
    it "has many progresses" do
      relate = described_class.reflect_on_association(:progresses)
      expect(relate.macro).to eq :has_many
    end
  end


end



