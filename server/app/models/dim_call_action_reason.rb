# == Schema Information
#
# Table name: dim_call_action_reasons
#
#  id                 :integer          not null, primary key
#  active             :boolean          default(TRUE)
#  call_action_reason :string(50)       default(""), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_dim_call_action_reasons_on_call_action_reason  (call_action_reason) UNIQUE
#

class DimCallActionReason < ApplicationRecord
  validates :call_action_reason, presence: true, uniqueness: true, :length => { :maximum => 50 }
end
