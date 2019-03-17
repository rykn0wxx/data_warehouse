module Mudhead
  class BaseData

    attr_accessor :base_path

    RAW_FILES = [
      {
        :file => 'dim_region.csv',
        :model => DimRegion
      },
      {
        :file => 'dim_project.csv',
        :model => DimProject
      },
      {
        :file => 'dim_timezone.csv',
        :model => DimTimezone
      },
      {
        :file => 'dim_call_category.csv',
        :model => DimCallCategory
      },
      {
        :file => 'dim_call_type.csv',
        :model => DimCallType
      },
      {
        :file => 'dim_call_action.csv',
        :model => DimCallAction
      },
      {
        :file => 'dim_call_action_reason.csv',
        :model => DimCallActionReason
      },
      {
        :file => 'dim_disposition.csv',
        :model => DimCallDisp
      },
      {
        :file => 'dim_language.csv',
        :model => DimLanguage
      },
      {
        :file => 'dim_service.csv',
        :model => DimCallService
      }
    ]

    def initialize(raw_folder_path)
      @base_path = raw_folder_path
    end

    def start_simple_dim
      RAW_FILES.each do |rf|
        tmp_file = File.expand_path(File.join(base_path, rf[:file]))
        upload_data_to_table rf[:model], tmp_file if File.exist?(tmp_file)
      end
    end

    def add_dim_client
      tmp_file = File.expand_path(File.join(base_path, 'dim_client.csv'))
      client_opts = {
        before_batch_import: -> (importer) {
          options = option_generator(importer, DimProject, :dim_project_id, :project_name)
          importer.batch_replace(:dim_project_id, options)
        }
      }
      upload_data_to_table DimClient, tmp_file, client_opts if File.exist?(tmp_file)
    end

    def add_dim_uip_service
      tmp_file = File.expand_path(File.join(base_path, 'dim_uip_service.csv'))
      uip_serv_opts = {
        before_batch_import: -> (importer) {
          dim_call_service_opt = generate_option(DimCallService, :call_service)
          importer.batch_replace(:dim_call_service_id, dim_call_service_opt)

          dim_client_opt = generate_option(DimClient, :client_name)
          importer.batch_replace(:dim_client_id, dim_client_opt)

          dim_language_opt = generate_option(DimLanguage, :language_name)
          importer.batch_replace(:dim_language_id, dim_language_opt)
        },
        validate: true
      }
      upload_data_to_table DimUipService, tmp_file, uip_serv_opts if File.exist?(tmp_file)
    end

    protected

    def upload_data_to_table(target_model, raw_file, data_options = {})
      file_path = File.new(raw_file)
      dim_data = Mudhead::Importer.new(target_model, file_path, data_options)
      dim_data.import
    end

    def generate_option(assoc_model, target_column)
      tmp_assocs = assoc_model.pluck(target_column, :id)
      tmp_options = Hash[*tmp_assocs.flatten]
      tmp_options
    end

    def option_generator(importer, assoc_model, ref_column, target_column)
      tmp_names = importer.chunk.map { |x| x[ref_column] }.uniq
      tmp_assocs = assoc_model.where(target_column => tmp_names).pluck(target_column, :id)
      tmp_options = Hash[*tmp_assocs.flatten]
      tmp_options
    end

  end
end