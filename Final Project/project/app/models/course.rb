class Course < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :priority

  belongs_to :user
  has_many :assignments
end