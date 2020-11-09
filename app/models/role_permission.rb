# == Schema Information
#
# Table name: role_permissions
#
#  id            :bigint           not null, primary key
#  role_id       :bigint           not null
#  permission_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class RolePermission < ApplicationRecord
  belongs_to :permission
  belongs_to :role
  
  #untuk melakukan apakah access role memiliki data
  def self.check_status(role,permission)
      self.where('role_id = ?',role).where('permission_id = ?',permission).first
  end
  #=============

  #menghapus data access role data bahari berdasarkan role_id
  def self.destroy_oldrole(role)
      self.where('role_id = ?',role).destroy_all
  end
  #==============
end
