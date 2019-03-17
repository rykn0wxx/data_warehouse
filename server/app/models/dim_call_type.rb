# == Schema Information
#
# Table name: dim_call_types
#
#  id         :integer          not null, primary key
#  active     :boolean          default(TRUE)
#  call_type  :string(20)       default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_dim_call_types_on_call_type  (call_type) UNIQUE
#

class DimCallType < ApplicationRecord
  validates :call_type, presence: true, uniqueness: true, :length => { :maximum => 20 }
end
