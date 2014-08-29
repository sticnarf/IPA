class User < ActiveRecord::Base
  include ActiveModel::Validations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  enum user_type: [ :validating, :visitor, :member, :admin ]

  validates_presence_of [:name, :user_type]
  validates_presence_of [:class_name, :department], :unless => :visitor?
  validates :qq, format: { with: /\A[1-9][0-9]{4,10}\Z/ }, :unless => :visitor?
  validates :tel, format: { with: /\A[\d,\s,\-]{7,20}\Z/ }, :unless => :visitor?
  validate :check_departments, :unless => :visitor?

  after_create :check_member

  def user_type_enum
    [['validating', 0], ['visitor', 1], ['member', 2], ['admin', 3]]
  end

  private

  # Prevent malicious registrations
  def check_member
    self.validating! if self.member?
    self.visitor! if self.admin?
  end

  def check_departments
    table = {
        photo: [:photo_equipment],
        post: [:post_software],
        pub: [:pub_skill],
        film: [:film_post, :film_equipment],
        hp: [:hp_direction, :hp_tech]
    }
    table.each do |key, value|
      if department and department.include? key
        value.each do |field|
          errors[field] << "Empty!" if send(field).blank?
        end
      end
    end
  end

end