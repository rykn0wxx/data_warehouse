class CreateDimCallActions < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_call_actions do |t|
      t.string :call_action,      :limit => 50, :null => false, :default => ""
      t.boolean :active,          :default => true

      t.timestamps
    end
    add_index :dim_call_actions, :call_action, unique: true
  end
end
