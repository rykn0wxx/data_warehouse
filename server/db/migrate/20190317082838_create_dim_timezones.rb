class CreateDimTimezones < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_timezones do |t|
      t.string :timezone_name,    :limit => 100, :null => false, :default => ""
      t.boolean :active,          :default => true

      t.timestamps
    end
    add_index :dim_timezones, :timezone_name, unique: true
  end
end
