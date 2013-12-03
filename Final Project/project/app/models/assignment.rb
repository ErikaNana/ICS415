class Assignment < ActiveRecord::Base
    attr_accessible :dueDate
    attr_accessible :name
    attr_accessible :priority
    attr_accessible :description
    attr_accessible :className
    attr_accessible :status
    attr_accessible :course_id
    attr_accessible :user_id

    belongs_to :course
end