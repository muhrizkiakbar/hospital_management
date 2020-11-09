# == Schema Information
#
# Table name: permissions
#
#  id          :bigint           not null, primary key
#  name        :string
#  resource    :string
#  action      :string
#  description :text
#  page        :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#  deleted_at  :datetime
#
require 'test_helper'

class PermissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
