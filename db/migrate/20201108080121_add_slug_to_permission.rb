class AddSlugToPermission < ActiveRecord::Migration[6.0]
  def change
    add_column :permissions, :slug, :string
    add_index :permissions, :slug, unique: true
  end
end
