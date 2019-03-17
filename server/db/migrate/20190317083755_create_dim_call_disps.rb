class CreateDimCallDisps < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_call_disps do |t|
      t.string :call_disp,              :limit => 100, :null => false, :default => ""
      t.boolean :active,                :default => true

      t.timestamps
    end
    add_index :dim_call_disps, :call_disp, unique: true
  end
end
