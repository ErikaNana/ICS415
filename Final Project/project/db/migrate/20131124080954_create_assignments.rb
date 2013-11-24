class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
        t.string :name
        t.string :priority
        t.string :description
        t.string :className
        t.string :dueDate
        t.timestamps
    end
  end
end
