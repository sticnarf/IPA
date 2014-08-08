class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum user_type: [ :validating, :visitor, :member ]
  validates :name, presence: true
  validates :class_name, presence: true, :unless => :visitor?
  after_create :check_member

  private

  def check_member
    self.validating! if self.member?
  end
end
