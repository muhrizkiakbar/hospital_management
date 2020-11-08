class AddDeletedAtToDepartment < ActiveRecord::Migration[6.0]
  def change
    add_column :departments, :deleted_at, :datetime
    add_index :departments, :deleted_at
  end
end
