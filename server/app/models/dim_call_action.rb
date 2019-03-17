# == Schema Information
#
# Table name: dim_call_actions
#
#  id          :integer          not null, primary key
#  active      :boolean          default(TRUE)
#  call_action :string(50)       default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_dim_call_actions_on_call_action  (call_action) UNIQUE
#

class DimCallAction < ApplicationRecord
  validates :call_action, presence: true, uniqueness: true, :length => { :maximum => 50 }
end
