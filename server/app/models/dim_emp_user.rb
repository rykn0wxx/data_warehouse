# == Schema Information
#
# Table name: dim_emp_users
#
#  id         :integer          not null, primary key
#  active     :boolean          default(TRUE)
#  first_name :string           default(""), not null
#  hire_date  :date             not null
#  last_name  :string           default(""), not null
#  term_date  :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  emp_id     :string           default(""), not null
#  login_id   :string           default(""), not null
#
# Indexes
#
#  index_dim_emp_users_on_emp_id    (emp_id) UNIQUE
#  index_dim_emp_users_on_login_id  (login_id) UNIQUE
#

class DimEmpUser < ApplicationRecord
  has_many :dim_uip_users
  validates :emp_id, :login_id, presence: true, uniqueness: true
  validates :first_name, :last_name, :hire_date, presence: true
end
