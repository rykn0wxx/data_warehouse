# == Schema Information
#
# Table name: dim_ivr_params
#
#  id             :integer          not null, primary key
#  active         :boolean          default(TRUE)
#  ivr_code       :integer          not null
#  ivr_param      :string           default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  dim_project_id :integer
#
# Indexes
#
#  index_dim_ivr_params_on_dim_project_id  (dim_project_id)
#

class DimIvrParam < ApplicationRecord
  belongs_to :dim_project
  validates :ivr_param, :ivr_code, presence: true
end
