class Assignment < ActiveRecord::Base
    attr_accessible :dueDate
    attr_accessible :name
    attr_accessible :priority
    attr_accessible :description
    attr_accessible :className
end