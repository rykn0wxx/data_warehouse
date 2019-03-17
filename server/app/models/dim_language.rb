# == Schema Information
#
# Table name: dim_languages
#
#  id            :integer          not null, primary key
#  active        :boolean          default(TRUE)
#  language_name :string(50)       default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_dim_languages_on_language_name  (language_name) UNIQUE
#

class DimLanguage < ApplicationRecord
  has_many :dim_uip_services
  validates :language_name, presence: true, uniqueness: true, :length => { :maximum => 50 }
end
