class ConfigurationDetailsController < ApplicationController
  before_action :set_configuration_detail, only: [:show, :edit, :update, :destroy]

  # GET /configuration_details
  # GET /configuration_details.json
  def index
    @configuration_details = ConfigurationDetail.all
  end

  # GET /configuration_details/1
  # GET /configuration_details/1.json
  def show
  end

  # GET /configuration_details/new
  def new
    @configuration_detail = ConfigurationDetail.new
  end

  # GET /configuration_details/1/edit
  def edit
  end

  # POST /configuration_details
  # POST /configuration_details.json
  def create
    @configuration_detail = ConfigurationDetail.new(configuration_detail_params)

    respond_to do |format|
      if @configuration_detail.save
        format.html { redirect_to @configuration_detail, notice: 'Configuration detail was successfully created.' }
        format.json { render :show, status: :created, location: @configuration_detail }
      else
        format.html { render :new }
        format.json { render json: @configuration_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configuration_details/1
  # PATCH/PUT /configuration_details/1.json
  def update
    respond_to do |format|
      if @configuration_detail.update(configuration_detail_params)
        format.html { redirect_to @configuration_detail, notice: 'Configuration detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @configuration_detail }
      else
        format.html { render :edit }
        format.json { render json: @configuration_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configuration_details/1
  # DELETE /configuration_details/1.json
  def destroy
    @configuration_detail.destroy
    respond_to do |format|
      format.html { redirect_to configuration_details_url, notice: 'Configuration detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configuration_detail
      @configuration_detail = ConfigurationDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def configuration_detail_params
      params.require(:configuration_detail).permit(:configuration_template_id, :configuration_detail_type_id, :configuration_detail_order, :configuration_detail_data)
    end
end
