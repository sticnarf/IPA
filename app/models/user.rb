class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  enum user_type: [ :validating, :visitor, :member, :admin ]
  validates :name, presence: true
  validates :class_name, presence: true, :unless => :visitor?
  validates :user_type, presence: true
  after_create :check_member

  def user_type_enum
    [['validating', 0], ['visitor', 1], ['member', 2], ['admin', 3]]
  end

  private

  def check_member
    self.validating! if self.member?
    self.visitor! if self.admin?
  end
end
