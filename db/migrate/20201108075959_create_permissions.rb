class CreatePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :resource
      t.string :action
      t.text :description
      t.boolean :page

      t.timestamps
    end
  end
end
