require "application_system_test_case"

class DepartmentsTest < ApplicationSystemTestCase
  setup do
    @department = departments(:one)
  end

  test "visiting the index" do
    visit departments_url
    assert_selector "h1", text: "Departments"
  end

  test "creating a Department" do
    visit departments_url
    click_on "New Department"

    fill_in "Current level", with: @department.current_level
    fill_in "Level1", with: @department.level1
    fill_in "Level2", with: @department.level2
    fill_in "Level3", with: @department.level3
    fill_in "Level4", with: @department.level4
    fill_in "Level5", with: @department.level5
    fill_in "Level6", with: @department.level6
    fill_in "Name", with: @department.name
    fill_in "Path", with: @department.path
    click_on "Create Department"

    assert_text "Department was successfully created"
    click_on "Back"
  end

  test "updating a Department" do
    visit departments_url
    click_on "Edit", match: :first

    fill_in "Current level", with: @department.current_level
    fill_in "Level1", with: @department.level1
    fill_in "Level2", with: @department.level2
    fill_in "Level3", with: @department.level3
    fill_in "Level4", with: @department.level4
    fill_in "Level5", with: @department.level5
    fill_in "Level6", with: @department.level6
    fill_in "Name", with: @department.name
    fill_in "Path", with: @department.path
    click_on "Update Department"

    assert_text "Department was successfully updated"
    click_on "Back"
  end

  test "destroying a Department" do
    visit departments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Department was successfully destroyed"
  end
end
