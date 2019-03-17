class CreateDimRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_regions do |t|
      t.string :region_name,      :limit => 50, :null => false, :default => ""
      t.string :region_label,     :limit => 20, :null => false, :default => ""
      t.string :region_code,      :limit => 5, :null => false, :default => ""
      t.boolean :active,          :default => true

      t.timestamps
    end
    add_index :dim_regions, :region_name, unique: true
  end
end
