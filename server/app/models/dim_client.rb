# == Schema Information
#
# Table name: dim_clients
#
#  id             :integer          not null, primary key
#  active         :boolean          default(TRUE)
#  client_name    :string(100)      default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  dim_project_id :integer
#
# Indexes
#
#  index_dim_clients_on_client_name     (client_name) UNIQUE
#  index_dim_clients_on_dim_project_id  (dim_project_id)
#

class DimClient < ApplicationRecord
  belongs_to :dim_project
  has_many :dim_uip_services
  validates :client_name, presence: true, uniqueness: true, :length => { :maximum => 100 }
end
