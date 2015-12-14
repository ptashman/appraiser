class CensusRecordsController < ApplicationController
  before_action :set_census_record, only: [:show, :edit, :update, :destroy]

  # GET /census_records
  # GET /census_records.json
  def index
    @census_records = CensusRecord.all
  end

  # GET /census_records/1
  # GET /census_records/1.json
  def show
  end

  # GET /census_records/new
  def new
    @census_record = CensusRecord.new
  end

  # GET /census_records/1/edit
  def edit
  end

  # POST /census_records
  # POST /census_records.json
  def create
    @census_record = CensusRecord.new(census_record_params)

    respond_to do |format|
      if @census_record.save
        format.html { redirect_to @census_record, notice: 'Census record was successfully created.' }
        format.json { render :show, status: :created, location: @census_record }
      else
        format.html { render :new }
        format.json { render json: @census_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /census_records/1
  # PATCH/PUT /census_records/1.json
  def update
    respond_to do |format|
      if @census_record.update(census_record_params)
        format.html { redirect_to @census_record, notice: 'Census record was successfully updated.' }
        format.json { render :show, status: :ok, location: @census_record }
      else
        format.html { render :edit }
        format.json { render json: @census_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /census_records/1
  # DELETE /census_records/1.json
  def destroy
    @census_record.destroy
    respond_to do |format|
      format.html { redirect_to census_records_url, notice: 'Census record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_census_record
      @census_record = CensusRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def census_record_params
      params[:census_record]
    end
end
