# == Schema Information
#
# Table name: dim_projects
#
#  id           :integer          not null, primary key
#  active       :boolean          default(TRUE)
#  project_name :string(100)      default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_dim_projects_on_project_name  (project_name) UNIQUE
#

class DimProject < ApplicationRecord
  has_many :dim_clients
  has_many :dim_uip_users
  has_many :dim_ivr_params
  validates :project_name, presence: true, uniqueness: true, :length => { :maximum => 100 }
end
