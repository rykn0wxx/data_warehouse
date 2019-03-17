class CreateDimCallCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_call_categories do |t|
      t.string :call_category,    :limit => 20, :null => false, :default => ""
      t.boolean :active,          :default => true

      t.timestamps
    end
    add_index :dim_call_categories, :call_category, unique: true
  end
end
