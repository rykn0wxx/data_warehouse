# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rails g model dim_project project_name:string:uniq active:boolean
# rails g model dim_client client_name:string:uniq active:boolean dim_project:references
# rails g model dim_timezone timezone_name:string:uniq active:boolean
# rails g model dim_call_category call_category:string:uniq active:boolean
# rails g model dim_call_type call_type:string:uniq active:boolean
# rails g model dim_call_action call_action:string:uniq active:boolean
# rails g model dim_call_action_reason call_action_reason:string:uniq active:boolean
# rails g model dim_call_disp call_disp:string:uniq active:boolean
# rails g model dim_call_service call_service:string:uniq active:boolean
# rails g model dim_language language_name:string:uniq active:boolean
# rails g model dim_uip_service service_id:integer dim_call_service:references dim_client:references dim_language:references active:boolean
# rails g model dim_emp_user emp_id:string:uniq last_name:string first_name:string login_id:string:uniq active:boolean hire_date:date term_date:date
# rails g model dim_uip_user uip_id:string:uniq dim_emp_user:references dim_project:references active:boolean start_date:date end_date:date
# rails g model dim_ivr_param ivr_param:string ivr_code:integer dim_project:references active:boolean
# rails g model tmp_fact_call_detail tmp_parent_project:string tmp_project_name:string tmp_timezone:string tmp_call_category:string tmp_call_type:string tmp_call_action:string tmp_call_action_reason:string tmp_disp:string tmp_service_id:integer tmp_service_name:string tmp_orig_srv:integer tmp_user_id:string tmp_ivr_param_1:string tmp_ivr_param_2:string tmp_ivr_param_3:string tmp_ivr_param_4:string tmp_ivr_param_9:string tmp_ivr_param_10:string tmp_ivr_param_16:string tmp_ivr_param_18:string tmp_ivr_param_19:string tmp_call:integer tmp_seq:integer tmp_dialed_num:string tmp_answer_date:datetime tmp_end_date:datetime tmp_end_date_tz:datetime tmp_start_date:datetime tmp_start_date_tz:datetime tmp_wrap_end_date:datetime tmp_hold_number:integer tmp_queue_time:integer tmp_talk_time:integer tmp_hold_time:integer tmp_wrap_time:integer

# Set initial undefined values
# require 'date'
# DimRegion.create!(:region_name => 'Undefined', :region_label => 'Undefined', :region_code => 'un')
# DimProject.create!(:project_name => 'Undefined')
# DimClient.create!(:client_name => 'Undefined', :dim_project_id => 1)
# DimTimezone.create!(:timezone_name => 'Undefined')
# DimCallCategory.create!(:call_category => 'Undefined')
# DimCallType.create!(:call_type => 'Undefined')
# DimCallAction.create!(:call_action => 'Undefined')
# DimCallActionReason.create!(:call_action_reason => 'Undefined')
# DimCallDisp.create!(:call_disp => 'Undefined')
# DimCallService.create!(:call_service => 'Undefined')
# DimLanguage.create!(:language_name => 'Undefined')
# DimUipService.create!(:service_id => 0, :dim_call_service_id => 1, :dim_client_id => 1, :dim_language_id => 1)
# DimEmpUser.create!(:emp_id => '000000', :last_name => 'Undefined', :first_name => 'Undefined', :login_id => 'undefined', :hire_date => Date.new(2019, 1, 1))
# DimUipUser.create!(:uip_id => 'undefined', :dim_emp_user_id => 1, :dim_project_id => 1, :start_date => Date.new(2019, 1, 1))
# DimIvrParam.create!(:ivr_param => 'undefined', :ivr_code => 1, :dim_project_id => 1)
