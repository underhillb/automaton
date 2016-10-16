class ConfigurationTemplatesController < ApplicationController
  before_action :set_configuration_template, only: [:show, :edit, :update, :destroy]

  # GET /configuration_templates
  # GET /configuration_templates.json

  def index
    respond_to do |format|
      puts params.inspect
      format.html
      format.json {
        data= ConfigurationTemplate.all
        .where("name LIKE ?", "%#{params[:name]}%")
        .where("description LIKE ?", "%#{params[:description]}%")
        render json: {'value' => data} }
      end
    end
  # GET /configuration_templates/1
  # GET /configuration_templates/1.json
  def show
  end

  # GET /configuration_templates/new
  def new
    @configuration_template = ConfigurationTemplate.new
  end

  # GET /configuration_templates/1/edit
  def edit
  end

  # POST /configuration_templates
  # POST /configuration_templates.json
  def create
    data = ConfigurationTemplate.new(name: params[:name], description: params[:description])
    data.save
    render json: data

  end

  # PATCH/PUT /configuration_templates/1
  # PATCH/PUT /configuration_templates/1.json
  def update
    if params[:name].blank?
  updated=@configuration_template.update(configuration_template_params)
else
  updated=@configuration_template.update(name: params[:name], description: params[:description])
end

    respond_to do |format|
      if updated
        format.html { redirect_to @configuration_template, notice: 'Blueprint was successfully updated.' }

        format.json { render json: @configuration_template }
      else
        puts @configuration_template.errors.inspect
        format.html { render :edit }
        format.json { render json: @configuration_template.errors, status: :unprocessable_entity }

      end
    end
  end

  # DELETE /configuration_templates/1
  # DELETE /configuration_templates/1.json
  def destroy
    if @configuration_template.destroy
      head :ok
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configuration_template
      @configuration_template = ConfigurationTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def configuration_template_params
      params.require(:configuration_template).permit(:name, :description, :blueprint_objects_id,configuration_details_attributes: [:id, :configuration_template_id,
        :configuration_detail_type_id, :configuration_detail_order, :configuration_detail_data,  :_destroy])
    end
end
