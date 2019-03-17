# == Schema Information
#
# Table name: dim_call_categories
#
#  id            :integer          not null, primary key
#  active        :boolean          default(TRUE)
#  call_category :string(20)       default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_dim_call_categories_on_call_category  (call_category) UNIQUE
#

class DimCallCategory < ApplicationRecord
  validates :call_category, presence: true, uniqueness: true, :length => { :maximum => 20 }
end
