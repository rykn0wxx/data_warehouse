# == Schema Information
#
# Table name: dim_regions
#
#  id           :integer          not null, primary key
#  active       :boolean          default(TRUE)
#  region_code  :string(5)        default(""), not null
#  region_label :string(20)       default(""), not null
#  region_name  :string(50)       default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_dim_regions_on_region_name  (region_name) UNIQUE
#

class DimRegion < ApplicationRecord
  validates :region_name, presence: true, uniqueness: true, :length => { :maximum => 50 }
  validates :region_label, presence: true, :length => { :maximum => 20 }
  validates :region_code, presence: true, :length => { :maximum => 5 }
end
