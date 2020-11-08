class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.integer :current_level
      t.integer :level1
      t.integer :level2
      t.integer :level3
      t.integer :level4
      t.integer :level5
      t.integer :level6
      t.string :path

      t.timestamps


t.references :department, foreign_key: {on_delete: :nullify}, null: true
    end
  end
end
