class CreateDimUipServices < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_uip_services do |t|
      t.integer :service_id,            :null => false
      t.references :dim_call_service,   :foreign_key => true
      t.references :dim_client,         :foreign_key => true
      t.references :dim_language,       :foreign_key => true
      t.boolean :active,                :default => true

      t.timestamps
    end
  end
end
