class Permission < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  acts_as_paranoid

  validates :name,:resource,:action,:description,:path , presence: true

  #setting paginasi
  paginates_per 30


  #relasi antar table
  has_many :role_permissions
  #relasi untuk akses table ke permission tanpa harus menggunakan access_roles
  has_many :roles, through: :role_permissions
  #========================

  def self.check_resource_and_action(resource,action)
    self.where('resource = ?',resource).where('action = ?',action).first
  end
end
