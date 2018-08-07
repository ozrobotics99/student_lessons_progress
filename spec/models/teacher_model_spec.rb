require 'rails_helper'


RSpec.describe Teacher, :type => :model do

  #fail on no first_name last_name
  it "new teacher is valid" do
    expect(Teacher.new).not_to be_valid
  end

  #test model and helper method
  context "check 2 or more teachers" do
    it "check names are correct" do
      teacher1 = Teacher.create!(:first_name => 'Test3', :last_name => 'Testing3')
      teacher2 = Teacher.create!(:first_name => 'Michael', :last_name => 'Jordan')
      expect(teacher1.first_name).to eq ("Test3")
      expect(teacher1.fullname).to eq ("Test3 Testing3")
      expect(teacher2.fullname).to eq ("Michael Jordan")
    end
  end

=begin
  #check associations
  context "check teacher" do
    it "has many enrolments" do
      relate = described_class.reflect_on_association(:enrolments)
      expect(relate.macro).to eq :has_many
    end
  end

=end

end



