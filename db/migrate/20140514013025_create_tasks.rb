class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.boolean :completed, default: false
      t.integer :position
      t.integer :project_id
      t.date    :deadline
      t.timestamps
    end
  end
end
