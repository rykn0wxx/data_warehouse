# == Schema Information
#
# Table name: dim_call_disps
#
#  id         :integer          not null, primary key
#  active     :boolean          default(TRUE)
#  call_disp  :string(100)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_dim_call_disps_on_call_disp  (call_disp) UNIQUE
#

class DimCallDisp < ApplicationRecord
  validates :call_disp, presence: true, uniqueness: true, :length => { :maximum => 100 }
end
