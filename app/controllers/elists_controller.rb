class ElistsController < ApplicationController
before_filter :authenticate_user!
  # before_action :set_elist, only: [:show, :edit, :update, :destroy]

  #cancancan
  load_and_authorize_resource


  # cancancan..
  #load_and_authorize_resource :elist

  # GET /elists
  def index
    @q = @elists.search params[:q]
    @elists = @q.result.page(params[:page])
  end

  # GET /elists/1
  def show
  end

  # GET /elists/new
  def new
  end

  # GET /elists/1/edit
  def edit
  end

  # POST /elists
  def create
    respond_to do |format|
      if @elist.save
        format.html { redirect_to @elist, notice: t('success_create') }
        format.json { render :show, status: :created, location: @elist }
      else
        format.html { render :new }
        format.json { render json: @elist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elists/1
  def update
    respond_to do |format|
      if @elist.update(elist_params)
        format.html { redirect_to @elist, notice: t('success_update') }
        format.json { render :show, status: :ok, location: @elist }
      else
        format.html { render :edit }
        format.json { render json: @elist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elists/1
  def destroy
    @elist.destroy
    respond_to do |format|
      format.html { redirect_to elists_url, notice: t('success_destroy') }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def elist_params
    params.require(:elist).permit(:email, :active_status, :sort_order)
  end
end
