class AddSlugToDepartment < ActiveRecord::Migration[6.0]
  def change
    add_column :departments, :slug, :string
    add_index :departments, :slug, unique: true
  end
end
