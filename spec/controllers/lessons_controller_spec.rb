require 'rails_helper'

RSpec.describe LessonsController, type: :controller do

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
  it "assigns @lessons" do
    lesson = Lesson.create!(:number => 1, :part_number => 2)
    get :index
    expect(assigns(:lessons)).to eq([lesson])
  end
end

describe "GET show" do
  it "should render lesson#show template" do
    lesson1 = Lesson.create!(:number => 1, :part_number => 3)
    get :show, params: { id: lesson1.id }
    expect(response).to have_http_status(200)
    expect(lesson1.number).to eq 1
    expect(lesson1.part_number).to eq 3
  end
end



describe "GET update" do
  it "should render lesson update template" do
    lesson3 = Lesson.create!(:number => 1, :part_number => 1)
    params = { number: 4, part_number: 5 }
    put :update, params: { id: lesson3.id, lesson: params }
    lesson3.reload
    expect(lesson3.number).to eq 4
    expect(lesson3.part_number).to eq 5
    expect(flash[:notice]).to eq 'Lesson was successfully updated.'
  end
end

describe "GET lesson new" do
  it "should render lesson new template" do
    get :new
    expect(response).to render_template(:new)
    expect(response.status).to eq(200)
    params = { number: 2, part_number: 1 }
    expect { post(:create, params: { lesson: params }) }.to change(Lesson, :count).by(1)
    expect(flash[:notice]).to eq 'Lesson was successfully created.'
  end
end

end
