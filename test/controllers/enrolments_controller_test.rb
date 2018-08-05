require 'test_helper'

class EnrolmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enrolment = enrolments(:one)
  end

  test "should get index" do
    get enrolments_url
    assert_response :success
  end

  test "should get new" do
    get new_enrolment_url
    assert_response :success
  end

  test "should create enrolment" do
    assert_difference('Enrolment.count') do
      post enrolments_url, params: { enrolment: { student_id: @enrolment.student_id, teacher_id: @enrolment.teacher_id } }
    end

    assert_redirected_to enrolment_url(Enrolment.last)
  end

  test "should show enrolment" do
    get enrolment_url(@enrolment)
    assert_response :success
  end

  test "should get edit" do
    get edit_enrolment_url(@enrolment)
    assert_response :success
  end

  test "should update enrolment" do
    patch enrolment_url(@enrolment), params: { enrolment: { student_id: @enrolment.student_id, teacher_id: @enrolment.teacher_id } }
    assert_redirected_to enrolment_url(@enrolment)
  end

  test "should destroy enrolment" do
    assert_difference('Enrolment.count', -1) do
      delete enrolment_url(@enrolment)
    end

    assert_redirected_to enrolments_url
  end
end
