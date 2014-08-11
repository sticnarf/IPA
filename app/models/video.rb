class Video < ActiveRecord::Base
  validates :url, presence: true
  validates :name, presence: true
end
