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
# User.create(:email => 'me@me.com', :username => 'me', :admin => true, :password => 'me', :password_confirmation => 'me')
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

# raw_files = [
#   {
#     :file => '../raw_files/dim_region.csv',
#     :model => DimRegion
#   },
#   {
#     :file => '../raw_files/dim_project.csv',
#     :model => DimProject
#   },
#   {
#     :file => '../raw_files/dim_timezone.csv',
#     :model => DimTimezone
#   },
#   {
#     :file => '../raw_files/dim_call_category.csv',
#     :model => DimCallCategory
#   },
#   {
#     :file => '../raw_files/dim_call_type.csv',
#     :model => DimCallType
#   },
#   {
#     :file => '../raw_files/dim_call_action.csv',
#     :model => DimCallAction
#   },
#   {
#     :file => '../raw_files/dim_call_action_reason.csv',
#     :model => DimCallActionReason
#   },
#   {
#     :file => '../raw_files/dim_disposition.csv',
#     :model => DimCallDisp
#   },
#   {
#     :file => '../raw_files/dim_language.csv',
#     :model => DimLanguage
#   }
# ]

# def process_file(file, ar_model)
#   file_path = File.new(file)
#   dim_data = Mudhead::Importer.new(ar_model, file_path, {})
#   dim_data.import
# end

# raw_files.each do |f|
#   process_file f[:file], f[:model]
# end

# def get_options(importer, assoc_model, ref_column, target_column)
#   target_sym = target_column.to_sym
#   tmp_names = importer.chunk.map { |x| x[ref_column] }.uniq
#   tmp_assocs = assoc_model.where(target_sym => tmp_names).pluck(target_sym, :id)
#   tmp_options = Hash[*tmp_assocs.flatten]
#   tmp_options
# end

# def upload_with_associations(ar_model, raw_file, batch_options)
#   file_path = File.new(raw_file)
#   dim_data = Mudhead::Importer.new(ar_model, file_path, batch_options)
#   dim_data.import
# end

# upload_with_associations(DimClient, '../raw_files/dim_client.csv', {
#   before_batch_import: -> (importer) {
#     project_names = importer.chunk.map { |x| x[:dim_project_id] }
#     projects = DimProject.where(project_name: project_names).pluck(:project_name, :id)
#     options = Hash[*projects.flatten]
#     importer.batch_replace(:dim_project_id, options)
#   }
# })

# upload_with_associations(DimCallService, '../raw_files/dim_service.csv', {})

# def upload_services
#   processed_data = []
#   spreadsheet = CSV.table('../raw_files/dim_uip_service.csv', { :headers => true })
#   trans_data = spreadsheet.map { |row| row.to_hash }
#   trans_data.each do |d|
#     dcs_id = DimCallService.find_by_call_service(d[:dim_call_service_id])
#     dl_id = DimLanguage.find_by_language_name(d[:dim_language_id])
#     dc_id = DimClient.find_by_client_name(d[:dim_client_id])
#     temp_data = {
#       :service_id => d[:service_id],
#       :dim_call_service_id => dcs_id.id,
#       :dim_language_id => dl_id.id,
#       :dim_client_id => dc_id.id
#     }
#     processed_data << temp_data
#   end
#   DimUipService.import processed_data, { :validate => true, :batch_size => 500}
# end

# upload_services

# Order of Call
# 1. raw_files (9)
# 2. upload_with_associations for DimClient (1)
# 3. upload_with_associations for DimCallService (1)
# 4. upload_services (1)
