class CreateDimCallTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_call_types do |t|
      t.string :call_type,      :limit => 20, :null => false, :default => ""
      t.boolean :active,        :default => true

      t.timestamps
    end
    add_index :dim_call_types, :call_type, unique: true
  end
end
