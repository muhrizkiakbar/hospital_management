require 'test_helper'

class DepartmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @department = departments(:one)
  end

  test "should get index" do
    get departments_url
    assert_response :success
  end

  test "should get new" do
    get new_department_url
    assert_response :success
  end

  test "should create department" do
    assert_difference('Department.count') do
      post departments_url, params: { department: { current_level: @department.current_level, level1: @department.level1, level2: @department.level2, level3: @department.level3, level4: @department.level4, level5: @department.level5, level6: @department.level6, name: @department.name, path: @department.path } }
    end

    assert_redirected_to department_url(Department.last)
  end

  test "should show department" do
    get department_url(@department)
    assert_response :success
  end

  test "should get edit" do
    get edit_department_url(@department)
    assert_response :success
  end

  test "should update department" do
    patch department_url(@department), params: { department: { current_level: @department.current_level, level1: @department.level1, level2: @department.level2, level3: @department.level3, level4: @department.level4, level5: @department.level5, level6: @department.level6, name: @department.name, path: @department.path } }
    assert_redirected_to department_url(@department)
  end

  test "should destroy department" do
    assert_difference('Department.count', -1) do
      delete department_url(@department)
    end

    assert_redirected_to departments_url
  end
end
