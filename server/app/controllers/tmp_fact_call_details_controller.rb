class TmpFactCallDetailsController < ApplicationController
  before_action :set_tmp_fact_call_detail, only: [:show, :edit, :update, :destroy]

  def run_dim
    @tmp_fact_call_details = TmpFactCallDetail.all
    @import = Mudhead::Importer.new(TmpFactCallDetail, nil, {})
    @import.check_or_add_dims(:tmp_parent_project, DimProject, :project_name)
    @import.check_or_add_dims(:tmp_timezone, DimTimezone, :timezone_name)
    @import.check_or_add_dims(:tmp_call_category, DimCallCategory, :call_category)
    @import.check_or_add_dims(:tmp_call_type, DimCallType, :call_type)
    @import.check_or_add_dims(:tmp_call_action, DimCallAction, :call_action)
    @import.check_or_add_dims(:tmp_call_action_reason, DimCallActionReason, :call_action_reason)
    @import.check_or_add_dims(:tmp_disp, DimCallDisp, :call_disp)
    @import.check_or_add_dims(:tmp_service_name, DimCallService, :call_service)
    @import.import_with_assoc(DimClient, TmpFactCallDetail.pluck(:tmp_parent_project, :tmp_project_name), {
      before_batch_import: -> (importer) {
        tmp_assocs = DimProject.pluck(:project_name, :id)
        tmp_options = Hash[*tmp_assocs.flatten]
        importer.batch_replace(:dim_project_id, tmp_options)
      },
      headers: [:dim_project_id, :client_name]
    })
    redirect_to tmp_fact_call_details_path
  end

  def index
    @tmp_fact_call_details = TmpFactCallDetail.all
    @tmp_fact = TmpFactCallDetail
  end

  def import
    @tmp_fact_call_detail = TmpFactCallDetail
    @import = Mudhead::Importer.new(@tmp_fact_call_detail, nil, {})
  end

  def do_import
    @tmp_fact_call_detail = TmpFactCallDetail
    @import = Mudhead::Importer.new(@tmp_fact_call_detail, params[:file], {})
    @import.import
    if @import.import_result.failed?
      render :import
    else
      redirect_to tmp_fact_call_details_path, notice: 'Temp records was successfully created.'
    end
  end

  private

    def set_tmp_fact_call_detail
      @tmp_fact_call_detail = TmpFactCallDetail.find(params[:id])
    end

    def tmp_fact_call_detail_params
      params.require(:tmp_fact_call_detail).permit(:tmp_parent_project, :tmp_project_name, :tmp_timezone, :tmp_call_category, :tmp_call_type, :tmp_call_action, :tmp_call_action_reason, :tmp_disp, :tmp_service_id, :tmp_service_name, :tmp_orig_srv, :tmp_user_id, :tmp_ivr_param_1, :tmp_ivr_param_2, :tmp_ivr_param_3, :tmp_ivr_param_4, :tmp_ivr_param_9, :tmp_ivr_param_10, :tmp_ivr_param_16, :tmp_ivr_param_18, :tmp_ivr_param_19, :tmp_call, :tmp_seq, :tmp_dialed_num, :tmp_answer_date, :tmp_end_date, :tmp_end_date_tz, :tmp_start_date, :tmp_start_date_tz, :tmp_wrap_end_date, :tmp_hold_number, :tmp_queue_time, :tmp_talk_time, :tmp_hold_time, :tmp_wrap_time)
    end
end
