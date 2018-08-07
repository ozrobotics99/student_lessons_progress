require 'rails_helper'

RSpec.describe EnrolmentsController, type: :controller do

#ok http status
describe "GET index" do
  it "has a 200 status code" do
    get :index
    expect(response.status).to eq(200)
  end
end

describe "GET index" do
  #can render template
  it "renders the index template" do
    get :index
    expect(response).to render_template("index")
  end
  #returns dishs on create
  it "assigns @enrolments" do
    student1 = Student.create!(:first_name => 'Test3', :last_name => 'Testing3')
    teacher1 = Teacher.create!(:first_name => 'Test', :last_name => 'Testing')
    enrolment = Enrolment.create!(:student_id => student1.id, :teacher_id => teacher1.id)
    get :index
    expect(assigns(:enrolments)).to eq([enrolment])
  end
end


describe "GET show" do
  it "should render enrolment#show template" do
    student1 = Student.create!(:first_name => 'Test3', :last_name => 'Testing3')
    teacher1 = Teacher.create!(:first_name => 'Test', :last_name => 'Testing')
    enrolment1 = Enrolment.create!(:student_id => student1.id, :teacher_id => teacher1.id)

    get :show, params: { id: enrolment1.id }
    expect(response).to have_http_status(200)
    expect(enrolment1.student_id).to eq student1.id
    expect(enrolment1.teacher_id).to eq teacher1.id
  end
end


describe "GET update" do
  it "should render enrolment update template" do
    student1 = Student.create!(:first_name => 'Test4', :last_name => 'Testing4')
    teacher1 = Teacher.create!(:first_name => 'Test', :last_name => 'Testing222')
    enrolment1 = Enrolment.create!(:student_id => student1.id, :teacher_id => teacher1.id)

    #update lesson to last
    t2 = Teacher.create!(:first_name => 'Michael', :last_name => 'Jordan')

    params = { teacher_id: t2.id }
    put :update, params: { id: enrolment1.id, enrolment: params }
    enrolment1.reload

    expect(enrolment1.teacher_id).to eq t2.id
    expect(enrolment1.student_id).to eq student1.id
    expect(flash[:notice]).to eq 'Enrolment was successfully updated.'
  end
end


end
