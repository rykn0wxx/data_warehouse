class TmpFactCallDetailsController < ApplicationController
  before_action :set_tmp_fact_call_detail, only: [:show, :edit, :update, :destroy]

  def run_dim
    @tmp_fact_call_details = TmpFactCallDetail.all
    TmpFactCallDetail.add_dimension(DimProject, :project_name, :tmp_parent_project)
    TmpFactCallDetail.add_dimension(DimClient, :client_name, :tmp_project_name)
    TmpFactCallDetail.add_dimension(DimTimezone, :timezone_name, :tmp_timezone)
    TmpFactCallDetail.add_dimension(DimCallCategory, :call_category, :tmp_call_category)
    TmpFactCallDetail.add_dimension(DimCallType, :call_type, :tmp_call_type)
    TmpFactCallDetail.add_dimension(DimCallAction, :call_action, :tmp_call_action)
    TmpFactCallDetail.add_dimension(DimCallActionReason, :call_action_reason, :tmp_call_action_reason)
    TmpFactCallDetail.add_dimension(DimCallDisp, :call_disp, :tmp_disp)
    TmpFactCallDetail.add_dimension(DimCallService, :call_service, :tmp_service_name)
    TmpFactCallDetail.add_dimension(DimCallService, :call_service, :tmp_service_name)
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
