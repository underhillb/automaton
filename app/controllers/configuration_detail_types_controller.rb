class ConfigurationDetailTypesController < ApplicationController
  before_action :set_configuration_detail_type, only: [:show, :edit, :update, :destroy]

  # GET /configuration_detail_types
  # GET /configuration_detail_types.json
  def index
    @configuration_detail_types = ConfigurationDetailType.all
  end

  # GET /configuration_detail_types/1
  # GET /configuration_detail_types/1.json
  def show
  end

  # GET /configuration_detail_types/new
  def new
    @configuration_detail_type = ConfigurationDetailType.new
  end

  # GET /configuration_detail_types/1/edit
  def edit
  end

  # POST /configuration_detail_types
  # POST /configuration_detail_types.json
  def create
    @configuration_detail_type = ConfigurationDetailType.new(configuration_detail_type_params)

    respond_to do |format|
      if @configuration_detail_type.save
        format.html { redirect_to @configuration_detail_type, notice: 'Configuration detail type was successfully created.' }
        format.json { render :show, status: :created, location: @configuration_detail_type }
      else
        format.html { render :new }
        format.json { render json: @configuration_detail_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configuration_detail_types/1
  # PATCH/PUT /configuration_detail_types/1.json
  def update
    respond_to do |format|
      if @configuration_detail_type.update(configuration_detail_type_params)
        format.html { redirect_to @configuration_detail_type, notice: 'Configuration detail type was successfully updated.' }
        format.json { render :show, status: :ok, location: @configuration_detail_type }
      else
        format.html { render :edit }
        format.json { render json: @configuration_detail_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configuration_detail_types/1
  # DELETE /configuration_detail_types/1.json
  def destroy
    @configuration_detail_type.destroy
    respond_to do |format|
      format.html { redirect_to configuration_detail_types_url, notice: 'Configuration detail type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configuration_detail_type
      @configuration_detail_type = ConfigurationDetailType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def configuration_detail_type_params
      params.require(:configuration_detail_type).permit(:name, :description)
    end
end
