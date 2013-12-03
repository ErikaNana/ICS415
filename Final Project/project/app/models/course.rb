class Course < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :priority
  attr_accessible :user_id

  belongs_to :user
  has_many :assignments
end