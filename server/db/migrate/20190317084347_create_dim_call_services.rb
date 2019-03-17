class CreateDimCallServices < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_call_services do |t|
      t.string :call_service,           :limit => 100, :null => false, :default => ""
      t.boolean :active,                :default => true

      t.timestamps
    end
    add_index :dim_call_services, :call_service, unique: true
  end
end
