class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :priority
      t.string :task_summary
      t.text :task_detail
      t.date :deadline
      t.integer :authority
      t.time :work_time

      t.timestamps
    end
  end
end
