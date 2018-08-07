require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

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
  it "assigns @students" do
    student = Student.create!(:first_name => 'Test', :last_name => 'Testing')
    get :index
    expect(assigns(:students)).to eq([student])
  end
end

describe "GET show" do
  it "should render student#show template" do
    student1 = Student.create!(:first_name => 'Test2', :last_name => 'Testing2')
    get :show, params: { id: student1.id }
    expect(response).to have_http_status(200)
    expect(student1.first_name).to eq "Test2"
    expect(student1.last_name).to eq "Testing2"
  end
end



describe "GET update" do
  it "should render student update template" do
    student3 = Student.create!(:first_name => 'Test3', :last_name => 'Testing3')
    params = { first_name: 'Boris', email: 'test@test.com' }
    put :update, params: { id: student3.id, student: params }
    student3.reload
    expect(student3.first_name).to eq 'Boris'
    expect(student3.email).to eq 'test@test.com'
    expect(flash[:notice]).to eq 'Student was successfully updated.'
  end
end

describe "GET student new" do
  it "should render student new template" do
    get :new
    expect(response).to render_template(:new)
    expect(response.status).to eq(200)
    params = { first_name: 'Andrew', last_name: 'Michaels' }
    expect { post(:create, params: { student: params }) }.to change(Student, :count).by(1)
    expect(flash[:notice]).to eq 'Student was successfully created.'
  end
end

end
