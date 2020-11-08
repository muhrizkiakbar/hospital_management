class Department < ApplicationRecord
    acts_as_paranoid
    has_many :child_id, foreign_key: "department_id", class_name: "department"
    belongs_to :parent_id, foreign_key: "department_id", class_name: "department", optional: true
end

