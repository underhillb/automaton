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
def format_configure_type
  puts params.inspect
  @div,detail_type_hash=params[:configuration_template][:configuration_details_attributes].first
  detail_type_id=detail_type_hash.values[0]
  @detail_type=ConfigurationDetailType.find(detail_type_id)
  @msg="#{@div} is selected, type is #{@detail_type.name}"
  puts @div
end
  # GET /configuration_detail_types/1
  # GET /configuration_detail_types/1.json

  # GET /configuration_detail_types/new

  # POST /configuration_detail_types
  # POST /configuration_detail_types.json
  def create
    data = ConfigurationDetailType.new(name: params[:name], description: params[:description],configure_format: params[:configure_format])
    if data.save
    render json: data
    end
  end

  # PATCH/PUT /configuration_detail_types/1
  # PATCH/PUT /configuration_detail_types/1.json
  def update
    respond_to do |format|
      if @configuration_detail_type.update(name: params[:name], description: params[:description], configure_format: params[:cofigure_format])
        format.json { render json: @configuration_detail_type }
      end
    end
  end

  # DELETE /configuration_detail_types/1
  # DELETE /configuration_detail_types/1.json
  def destroy
    if @configuration_detail_type.destroy
      head :ok
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_configuration_detail_type
    @configuration_detail_type = ConfigurationDetailType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def configuration_detail_type_params
    params.require(:configuration_detail_type).permit(:name, :description, :configure_format)
  end
end
