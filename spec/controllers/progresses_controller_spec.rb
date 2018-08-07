require 'rails_helper'

RSpec.describe ProgressesController, type: :controller do

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
  it "assigns @progresses" do
    student1 = Student.create!(:first_name => 'Test3', :last_name => 'Testing3')
    lesson1 = Lesson.create!(:number => 1, :part_number => 2)
    progress = Progress.create!(:student_id => student1.id, :lesson_id => lesson1.id)
    get :index
    expect(assigns(:progresses)).to eq([progress])
  end
end

describe "GET show" do
  it "should render progress#show template" do
    student1 = Student.create!(:first_name => 'Test1', :last_name => 'Testing1')
    lesson1 = Lesson.create!(:number => 1, :part_number => 4)
    progress1 = Progress.create!(:student_id => student1.id, :lesson_id => lesson1.id)
    get :show, params: { id: progress1.id }
    expect(response).to have_http_status(200)
    expect(progress1.student_id).to eq student1.id
    expect(progress1.lesson_id).to eq lesson1.id
  end
end

describe "GET update" do
  it "should render progress update template" do
    student1 = Student.create!(:first_name => 'Test123', :last_name => 'Testing155')
    lesson1 = Lesson.create!(:number => 3, :part_number => 2)
    progress3 = Progress.create!(:student_id => student1.id, :lesson_id => lesson1.id)

    #update lesson to last
    lesson_next = Lesson.create!(:number => 3, :part_number => 3)
    params = { lesson_id: lesson_next.id }
    put :update, params: { id: progress3.id, progress: params }
    progress3.reload

    expect(progress3.lesson_id).to eq lesson_next.id
    expect(progress3.student_id).to eq student1.id
    expect(flash[:notice]).to eq 'Progress was successfully updated.'
  end
end

end
