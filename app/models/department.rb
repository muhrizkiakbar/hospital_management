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
class Department < ApplicationRecord
    acts_as_paranoid
    has_many :child_id, foreign_key: "department_id", class_name: "Department"
    belongs_to :parent_id, foreign_key: "department_id", class_name: "Department", optional: true
end


