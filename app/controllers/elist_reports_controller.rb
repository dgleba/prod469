class ElistReportsController < ApplicationController
before_filter :authenticate_user!
  # before_action :set_elist_report, only: [:show, :edit, :update, :destroy]

  #cancancan
  load_and_authorize_resource


  # cancancan..
  #load_and_authorize_resource :elist_report

  # GET /elist_reports
  def index
    @q = @elist_reports.search params[:q]
    @elist_reports = @q.result.page(params[:page])
  end

  # GET /elist_reports/1
  def show
  end

  # GET /elist_reports/new
  def new
  end

  # GET /elist_reports/1/edit
  def edit
  end

  # POST /elist_reports
  def create
    respond_to do |format|
      if @elist_report.save
        format.html { redirect_to @elist_report, notice: t('success_create') }
        format.json { render :show, status: :created, location: @elist_report }
      else
        format.html { render :new }
        format.json { render json: @elist_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elist_reports/1
  def update
    respond_to do |format|
      if @elist_report.update(elist_report_params)
        format.html { redirect_to @elist_report, notice: t('success_update') }
        format.json { render :show, status: :ok, location: @elist_report }
      else
        format.html { render :edit }
        format.json { render json: @elist_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elist_reports/1
  def destroy
    @elist_report.destroy
    respond_to do |format|
      format.html { redirect_to elist_reports_url, notice: t('success_destroy') }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def elist_report_params
    params.require(:elist_report).permit(:when_to_send, :elist_id, :report_id, :active_status, :sort_order)
  end
end
