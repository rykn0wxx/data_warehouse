class CreateTmpFactCallDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :tmp_fact_call_details do |t|
      t.string :tmp_parent_project
      t.string :tmp_project_name
      t.string :tmp_timezone
      t.string :tmp_call_category
      t.string :tmp_call_type
      t.string :tmp_call_action
      t.string :tmp_call_action_reason
      t.string :tmp_disp
      t.integer :tmp_service_id
      t.string :tmp_service_name
      t.integer :tmp_orig_srv
      t.string :tmp_user_id
      t.string :tmp_ivr_param_1
      t.string :tmp_ivr_param_2
      t.string :tmp_ivr_param_3
      t.string :tmp_ivr_param_4
      t.string :tmp_ivr_param_9
      t.string :tmp_ivr_param_10
      t.string :tmp_ivr_param_16
      t.string :tmp_ivr_param_18
      t.string :tmp_ivr_param_19
      t.integer :tmp_call
      t.integer :tmp_seq
      t.string :tmp_dialed_num
      t.datetime :tmp_answer_date
      t.datetime :tmp_end_date
      t.datetime :tmp_end_date_tz
      t.datetime :tmp_start_date
      t.datetime :tmp_start_date_tz
      t.datetime :tmp_wrap_end_date
      t.integer :tmp_hold_number
      t.integer :tmp_queue_time
      t.integer :tmp_talk_time
      t.integer :tmp_hold_time
      t.integer :tmp_wrap_time

      t.timestamps
    end
  end
end
