class CreateDimCallActionReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_call_action_reasons do |t|
      t.string :call_action_reason,     :limit => 50, :null => false, :default => ""
      t.boolean :active,                :default => true

      t.timestamps
    end
    add_index :dim_call_action_reasons, :call_action_reason, unique: true
  end
end
