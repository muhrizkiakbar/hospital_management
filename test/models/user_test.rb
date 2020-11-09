# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  username               :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  nip                    :string
#  ktp                    :string
#  honorific              :string
#  first_name             :string
#  last_name              :string
#  academic_degree        :string
#  date_birth             :date
#  gender                 :string
#  postal_code            :string
#  address                :text
#  rt_number              :string
#  rw_number              :string
#  medical_staff          :integer
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :bigint
#  avatar_updated_at      :datetime
#  slug                   :string
#  deleted_at             :datetime
#  role_id                :bigint           not null
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
