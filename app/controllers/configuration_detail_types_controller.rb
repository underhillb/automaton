class ConfigurationDetailTypesController < ApplicationController
  before_action :set_configuration_detail_type, only: [:show, :edit, :update, :destroy]

  # GET /configuration_detail_types
  # GET /configuration_detail_types.json
  def index
    respond_to do |format|
      format.html
      format.json {
        data=ConfigurationDetailType.all
        .where("name LIKE ?", "%#{params[:name]}%")
        .where("description LIKE ?", "%#{params[:description]}%")
        render json: {'value' => data}
      }
      #.where("name LIKE ?", "%#{params[:name]}%")
    end
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
    data = ConfigurationDetailType.new(name: params[:name], description: params[:description])
    data.save
    render json: data
  end

  # PATCH/PUT /configuration_detail_types/1
  # PATCH/PUT /configuration_detail_types/1.json
  def update
    respond_to do |format|
      if @configuration_detail_type.update(name: params[:name], description: params[:description])
        format.json { render json: @configuration_detail_type }
      end
    end
  end

  # DELETE /configuration_detail_types/1
  # DELETE /configuration_detail_types/1.json
  def destroy
    @configuration_detail_type.destroy
    render nothing: true, status: 200
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
