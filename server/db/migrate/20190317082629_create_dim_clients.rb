class CreateDimClients < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_clients do |t|
      t.string :client_name,      :limit => 100, :null => false, :default => ""
      t.boolean :active,          :default => true
      t.references :dim_project,  :foreign_key => true

      t.timestamps
    end
    add_index :dim_clients, :client_name, unique: true
  end
end
