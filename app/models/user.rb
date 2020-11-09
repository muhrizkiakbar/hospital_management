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
#  address                :string
#  rt_number              :string
#  rw_number              :string
#  medical_staff          :string
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
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  #include plugin paranoia dan friendly_id
  acts_as_paranoid

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  #relasi
  belongs_to :role

  #setting paginasi
  paginates_per 30

  enum gender: {Male: "male", Female: "female"}

  # pakai gem paperclip gasan meupload gambar
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/default_user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes

  #validasi gasan penambahan user
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username

  validates :nip, :ktp, :first_name, :last_name, :academic_degree, :date_birth, :gender, :postal_code,
            :address, :rt_number, :rw_number, :medical_staff, presence: true
  validates :first_name, :last_name, :gender, :medical_staff, :format => { :with => /\A[a-zA-Z]+\z/,
                                                                           :message => "Only letters allowed." }
  validates :nip,:ktp, :postal_code, :rt_number,:rw_number, :format => { :with => /^[0-9]*$/,
                                                                           :message => "Only numbers allowed." }
  validates :slug,     uniqueness: true
  validates :gender, inclusion: %w(male female)


  #function gasan login
  attr_writer :login

  def login
    @login || self.username || self.email
  end
  

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end     


end
