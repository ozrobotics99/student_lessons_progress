require 'rails_helper'

RSpec.describe TeachersController, type: :controller do

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
  it "assigns @teachers" do
    teacher = Teacher.create!(:first_name => 'Test', :last_name => 'Testing')
    get :index
    expect(assigns(:teachers)).to eq([teacher])
  end
end

describe "GET show" do
  it "should render teacher#show template" do
    teacher1 = Teacher.create!(:first_name => 'Test2', :last_name => 'Testing2')
    get :show, params: { id: teacher1.id }
    expect(response).to have_http_status(200)
    expect(teacher1.first_name).to eq "Test2"
    expect(teacher1.last_name).to eq "Testing2"
  end
end



describe "GET update" do
  it "should render teacher update template" do
    teacher3 = Teacher.create!(:first_name => 'Test3', :last_name => 'Testing3')
    params = { first_name: 'Boris', email: 'test@test.com' }
    put :update, params: { id: teacher3.id, teacher: params }
    teacher3.reload
    expect(teacher3.first_name).to eq 'Boris'
    expect(teacher3.email).to eq 'test@test.com'
    expect(flash[:notice]).to eq 'Teacher was successfully updated.'
  end
end

describe "GET teacher new" do
  it "should render teacher new template" do
    get :new
    expect(response).to render_template(:new)
    expect(response.status).to eq(200)
    params = { first_name: 'Andrew', last_name: 'Michaels' }
    expect { post(:create, params: { teacher: params }) }.to change(Teacher, :count).by(1)
    expect(flash[:notice]).to eq 'Teacher was successfully created.'
  end
end

end
