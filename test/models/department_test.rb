# == Schema Information
#
# Table name: departments
#
#  id            :bigint           not null, primary key
#  name          :string
#  current_level :integer
#  level1        :integer
#  level2        :integer
#  level3        :integer
#  level4        :integer
#  level5        :integer
#  level6        :integer
#  path          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  slug          :string
#  deleted_at    :datetime
#
require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
