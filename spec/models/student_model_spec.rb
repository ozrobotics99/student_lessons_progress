require 'rails_helper'


RSpec.describe Student, :type => :model do

  #fail on no first_name last_name
  it "new student is valid" do
    expect(Student.new).not_to be_valid
  end

  #test model and helper method
  context "check 2 or more students" do
    it "check names are correct" do
      student1 = Student.create!(:first_name => 'Test3', :last_name => 'Testing3')
      student2 = Student.create!(:first_name => 'Michael', :last_name => 'Jordan')
      expect(student1.first_name).to eq ("Test3")
      expect(student1.fullname).to eq ("Test3 Testing3")
      expect(student2.fullname).to eq ("Michael Jordan")
    end
  end

  #check associations
  context "check student" do
    it "has many enrolments" do
      relate = described_class.reflect_on_association(:enrolments)
      expect(relate.macro).to eq :has_many
    end
  end

  context "check student" do
    it "has one progress" do
      relate = described_class.reflect_on_association(:progress)
      expect(relate.macro).to eq :has_one
    end
  end

end



