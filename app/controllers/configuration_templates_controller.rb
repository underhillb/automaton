class ConfigurationTemplatesController < ApplicationController
  before_action :set_configuration_template, only: [:show, :edit, :update, :destroy]

  # GET /configuration_templates
  # GET /configuration_templates.json
  def index
    @configuration_templates = ConfigurationTemplate.all
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
    @configuration_template = ConfigurationTemplate.new(configuration_template_params)

    respond_to do |format|
      if @configuration_template.save
        format.html { redirect_to @configuration_template, notice: 'Configuration template was successfully created.' }
        format.json { render :show, status: :created, location: @configuration_template }
      else
        format.html { render :new }
        format.json { render json: @configuration_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configuration_templates/1
  # PATCH/PUT /configuration_templates/1.json
  def update
    respond_to do |format|
      if @configuration_template.update(configuration_template_params)
        format.html { redirect_to @configuration_template, notice: 'Configuration template was successfully updated.' }
        format.json { render :show, status: :ok, location: @configuration_template }
      else
        format.html { render :edit }
        format.json { render json: @configuration_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configuration_templates/1
  # DELETE /configuration_templates/1.json
  def destroy
    @configuration_template.destroy
    respond_to do |format|
      format.html { redirect_to configuration_templates_url, notice: 'Configuration template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configuration_template
      @configuration_template = ConfigurationTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def configuration_template_params
      params.require(:configuration_template).permit(:name, :description, :blueprint_objects_id)
    end
end
