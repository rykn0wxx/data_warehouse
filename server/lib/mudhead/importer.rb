module Mudhead
  class Importer
    attr_reader :resource, :options, :result, :csv_file
    attr_accessor :chunk, :chunks, :headers

    OPTIONS = [
      :batch_size,
      :before_batch_import,
      :excluded_id,
      :validate
    ]

    def initialize(resource, csv_file, options = {})
      @resource = resource
      @csv_file = csv_file
      assign_options(options)
    end

    def import_result
      @import_result ||= ImportResult.new
    end

    def import
      process_file
      import_result
    end

    def import_options
      @import_options ||= options.slice(
        :validate,
        :batch_transaction,
        :validate_uniqueness
      )
    end

    def batch_replace(header_key, options)
      chunk.map! do |line|
        from = line[header_key]
        line[header_key] = options[from] if options.key?(from)
        line
      end
    end

    def check_or_add_dims(src_col, tar_model, tar_col)
      dim_heads = []
      src_arr = @resource.pluck(src_col).uniq.compact
      tar_arr = tar_model.pluck(tar_col)
      new_arr = src_arr.select { |x| !tar_arr.include?(x) }
      if new_arr.length > 0
        dim_heads.push(tar_col)
        tar_model.import(dim_heads, new_arr, :validate => true)
      end
    end

    def import_with_assoc(target_model, raw_data, data_options = {})
      imp_data = []
      col_headers = data_options[:headers]
      assign_options(data_options)
      raw_data.each do |rd|
        imp_data << Hash[[col_headers, rd].transpose]
      end
      @chunk = imp_data
      import_result.add(process_with_assoc(target_model, imp_data, col_headers), imp_data.length)
      import_result
    end

    protected

    def process_with_assoc(target_model, batch_added, batch_headers)
      batch_result = nil
      run_callback(:before_batch_import)
      ActiveRecord::Base.connection.reconnect!
      batch_result = target_model.import(batch_headers, batch_added, import_options)
      raise ActiveRecord::Rollback if import_options[:batch_transaction] && batch_result.failed_instances.any?
      batch_result
    end

    def cycle(batch)
      @chunk = batch
      import_result.add(batch_import, @chunk.length)
    end

    def process_file
      lines = []
      batch_size = options[:batch_size].to_i
      batches = SmarterCSV.process(@csv_file.path, @smart_options)
      Parallel.map(batches) do |b|
        cycle(b)
      end
    end

    # def batch_import
    #   batch_result = nil
    #   ActiveRecord::Base.connection.reconnect!
    #   @resource.transaction do
    #     run_callback(:before_batch_import)
    #     batch_added = to_be_added
    #     batch_headers = prepare_headers
    #     batch_result = @resource.import(batch_headers, batch_added, import_options)
    #     raise ActiveRecord::Rollback if import_options[:batch_transaction] && batch_result.failed_instances.any?
    #   end
    #   batch_result
    # end
    def batch_import
      batch_result = nil
      run_callback(:before_batch_import)
      batch_added = to_be_added
      batch_headers = prepare_headers
      ActiveRecord::Base.connection.reconnect!
      batch_result = @resource.import(batch_headers, batch_added, import_options)
      raise ActiveRecord::Rollback if import_options[:batch_transaction] && batch_result.failed_instances.any?
      batch_result
    end

    def to_be_added
      chunk.reject { |e| e.has_key?(@header_key) }
    end

    def prepare_headers
      @headers = chunk.map { |e| e.keys }.uniq.first
      @headers.delete(@options[:excluded_id]) if @options[:excluded_id]
      @headers
    end

    def run_callback(name)
      options[name].call(self) if options[name].is_a?(Proc)
    end

    def assign_options(options)
      @options = {
        :batch_size => 500,
        :validate => true,
        :validate_uniqueness => true
      }.merge(options.slice(*OPTIONS))
      smart_options
    end

    def smart_options
      @smart_options = {
        :strip_chars_from_headers => /[\-"]/,
        :chunk_size => 500,
        :remove_unmapped_keys => true,
        :verbose => true
      }
    end

  end
end