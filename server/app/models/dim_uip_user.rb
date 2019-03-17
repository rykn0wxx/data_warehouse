# == Schema Information
#
# Table name: dim_uip_users
#
#  id              :integer          not null, primary key
#  active          :boolean          default(TRUE)
#  end_date        :date
#  start_date      :date             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  dim_emp_user_id :integer
#  dim_project_id  :integer
#  uip_id          :string           default(""), not null
#
# Indexes
#
#  index_dim_uip_users_on_dim_emp_user_id  (dim_emp_user_id)
#  index_dim_uip_users_on_dim_project_id   (dim_project_id)
#  index_dim_uip_users_on_uip_id           (uip_id) UNIQUE
#

class DimUipUser < ApplicationRecord
  belongs_to :dim_emp_user
  belongs_to :dim_project
  validates :uip_id, presence: true, uniqueness: true
  validates :start_date, presence: true
end
