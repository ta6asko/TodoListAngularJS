class CreateSupplements < ActiveRecord::Migration
  def change
    create_table :supplements do |t|
      t.string   :file
      t.integer  :comment_id
      t.timestamps
    end
  end
end
