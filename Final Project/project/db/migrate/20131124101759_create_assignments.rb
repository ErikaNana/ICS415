class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
        t.string 'dueDate'
        t.string 'name'
        t.string 'priority'
        t.string 'className'
        t.string 'description'
        t.string 'status'
        t.integer 'course_id'
        t.integer 'user_id'
    end
  end
end
