class CreateDimEmpUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_emp_users do |t|
      t.string :emp_id,       :null => false, :default => ""
      t.string :last_name,    :null => false, :default => ""
      t.string :first_name,   :null => false, :default => ""
      t.string :login_id,     :null => false, :default => ""
      t.boolean :active,      :default => true
      t.date :hire_date,      :null => false
      t.date :term_date

      t.timestamps
    end
    add_index :dim_emp_users, :emp_id, unique: true
    add_index :dim_emp_users, :login_id, unique: true
  end
end
