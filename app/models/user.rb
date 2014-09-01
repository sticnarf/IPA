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
  validates_presence_of :department, :unless => :visitor?
  validates_presence_of :photo_equipment, :if => :photo?
  validates_presence_of :post_software, :if => :post?
  validates_presence_of :pub_skill, :if => :pub?
  validates_presence_of [:film_post, :film_equipment], :if => :film?
  validates_presence_of [:hp_direction, :hp_tech], :if => :hp?

  # validate :check_departments, :unless => :visitor?

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

  def photo?
    self.department and self.department.include? "photo"
  end

  def post?
    self.department and self.department.include? "post"
  end

  def film?
    self.department and self.department.include? "film"
  end

  def hp?
    self.department and self.department.include? "hp"
  end

  def pub?
    self.department and self.department.include? "pub"
  end

end