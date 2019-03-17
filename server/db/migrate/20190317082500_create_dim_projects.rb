class CreateDimProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_projects do |t|
      t.string :project_name,   :limit => 100, :null => false, :default => ""
      t.boolean :active,        :default => true

      t.timestamps
    end
    add_index :dim_projects, :project_name, unique: true
  end
end
