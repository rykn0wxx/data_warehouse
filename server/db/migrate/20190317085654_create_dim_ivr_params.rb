class CreateDimIvrParams < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_ivr_params do |t|
      t.string :ivr_param,          :null => false, :default => ""
      t.integer :ivr_code,          :null => false
      t.references :dim_project,    :foreign_key => true
      t.boolean :active,            :default => true

      t.timestamps
    end
  end
end
