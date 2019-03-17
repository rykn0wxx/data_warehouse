# == Schema Information
#
# Table name: dim_call_services
#
#  id           :integer          not null, primary key
#  active       :boolean          default(TRUE)
#  call_service :string(100)      default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_dim_call_services_on_call_service  (call_service) UNIQUE
#

class DimCallService < ApplicationRecord
  has_many :dim_uip_services
  validates :call_service, presence: true, uniqueness: true, :length => { :maximum => 100 }
end
