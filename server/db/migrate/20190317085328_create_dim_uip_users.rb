class CreateDimUipUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_uip_users do |t|
      t.string :uip_id,             :null => false, :default => ""
      t.references :dim_emp_user,   :foreign_key => true
      t.references :dim_project,    :foreign_key => true
      t.boolean :active,            :default => true
      t.date :start_date,           :null => false
      t.date :end_date

      t.timestamps
    end
    add_index :dim_uip_users, :uip_id, unique: true
  end
end
