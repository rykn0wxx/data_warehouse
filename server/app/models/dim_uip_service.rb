# == Schema Information
#
# Table name: dim_uip_services
#
#  id                  :integer          not null, primary key
#  active              :boolean          default(TRUE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  dim_call_service_id :integer
#  dim_client_id       :integer
#  dim_language_id     :integer
#  service_id          :integer          not null
#
# Indexes
#
#  index_dim_uip_services_on_dim_call_service_id  (dim_call_service_id)
#  index_dim_uip_services_on_dim_client_id        (dim_client_id)
#  index_dim_uip_services_on_dim_language_id      (dim_language_id)
#

class DimUipService < ApplicationRecord
  belongs_to :dim_call_service
  belongs_to :dim_client
  belongs_to :dim_language
  validates :service_id, presence: true
  validates :service_id, :uniqueness => {
    :scope => [:dim_call_service_id, :dim_client_id, :dim_language_id],
    :message => 'uip service record already exists'
  }
end
