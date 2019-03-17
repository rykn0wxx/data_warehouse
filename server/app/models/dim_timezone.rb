# == Schema Information
#
# Table name: dim_timezones
#
#  id            :integer          not null, primary key
#  active        :boolean          default(TRUE)
#  timezone_name :string(100)      default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_dim_timezones_on_timezone_name  (timezone_name) UNIQUE
#

class DimTimezone < ApplicationRecord
  validates :timezone_name, presence: true, uniqueness: true, :length => { :maximum => 100 }
end
