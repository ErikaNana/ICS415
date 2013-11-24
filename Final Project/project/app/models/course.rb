class Course < ActiveRecord::Base
    attr_accessible :name
    attr_accessible :dueDate
    attr_accessible :priority
end
