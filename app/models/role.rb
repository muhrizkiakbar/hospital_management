# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  deleted_at :datetime
#
class Role < ApplicationRecord
  #include plugin paranoia dan friendly_id
  acts_as_paranoid

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  validates :name, presence: true
  
  #setting paginasi
  paginates_per 30

  has_many :role_permissions
  has_many :permissions, through: :role_permissions
  has_many :users
end
