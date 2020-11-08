class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.integer :current_level
      t.integer :level1,:null => true
      t.integer :level2,:null => true
      t.integer :level3,:null => true
      t.integer :level4,:null => true
      t.integer :level5,:null => true
      t.integer :level6,:null => true
      t.string :path,:null => true

      t.timestamps


t.references :department, foreign_key: {on_delete: :nullify}, null: true
    end
  end
end
