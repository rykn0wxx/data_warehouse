# == Schema Information
#
# Table name: tmp_fact_call_details
#
#  id                     :integer          not null, primary key
#  tmp_answer_date        :datetime
#  tmp_call               :integer
#  tmp_call_action        :string
#  tmp_call_action_reason :string
#  tmp_call_category      :string
#  tmp_call_type          :string
#  tmp_dialed_num         :string
#  tmp_disp               :string
#  tmp_end_date           :datetime
#  tmp_end_date_tz        :datetime
#  tmp_hold_number        :integer
#  tmp_hold_time          :integer
#  tmp_ivr_param_1        :string
#  tmp_ivr_param_10       :string
#  tmp_ivr_param_16       :string
#  tmp_ivr_param_18       :string
#  tmp_ivr_param_19       :string
#  tmp_ivr_param_2        :string
#  tmp_ivr_param_3        :string
#  tmp_ivr_param_4        :string
#  tmp_ivr_param_9        :string
#  tmp_orig_srv           :integer
#  tmp_parent_project     :string
#  tmp_project_name       :string
#  tmp_queue_time         :integer
#  tmp_seq                :integer
#  tmp_service_name       :string
#  tmp_start_date         :datetime
#  tmp_start_date_tz      :datetime
#  tmp_talk_time          :integer
#  tmp_timezone           :string
#  tmp_wrap_end_date      :datetime
#  tmp_wrap_time          :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  tmp_service_id         :integer
#  tmp_user_id            :string
#

class TmpFactCallDetail < ApplicationRecord
  def self.add_dimension(target_dimension, target_col, ref_col)
    tmp_arr = TmpFactCallDetail.pluck(ref_col).uniq
    tmp_arr.each do |tmp|
      target_dimension.find_or_create_by(target_col => tmp)
    end
  end
end
