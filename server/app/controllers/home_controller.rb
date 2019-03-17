class HomeController < ApplicationController
  def index
  end
  def dim_uploader
    @models = ActiveRecord::Base.connection.tables.map { |model| model.capitalize.singularize.camelize }.sort
  end
  def do_import
    model_name = params[:model]
    model = model_name.classify.constantize
    @import = Mudhead::Importer.new(model, params[:file], {})
    @import.import
    if @import.import_result.failed?
      render :dim_uploader
    else
      redirect_to dim_uploader_path, notice: 'New records for #{model_name} was successfully created.'
    end
  end
end
