class ConfigurationFilesController < ApplicationController
  before_action :set_configuration_file, only: [:show, :edit, :update, :destroy]

  # GET /configuration_files
  # GET /configuration_files.json
  def index
    @configuration_files = ConfigurationFile.all
  end

  # GET /configuration_files/1
  # GET /configuration_files/1.json
  def show
  end

  # GET /configuration_files/new
  def new
    @configuration_file = ConfigurationFile.new
  end

  # GET /configuration_files/1/edit
  def edit
  end

  # POST /configuration_files
  # POST /configuration_files.json
  def create
    @configuration_file = ConfigurationFile.new(configuration_file_params)

    respond_to do |format|
      if @configuration_file.save
        format.html { redirect_to @configuration_file, notice: 'Configuration file was successfully created.' }
        format.json { render :show, status: :created, location: @configuration_file }
      else
        format.html { render :new }
        format.json { render json: @configuration_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configuration_files/1
  # PATCH/PUT /configuration_files/1.json
  def update
    respond_to do |format|
      if @configuration_file.update(configuration_file_params)
        format.html { redirect_to @configuration_file, notice: 'Configuration file was successfully updated.' }
        format.json { render :show, status: :ok, location: @configuration_file }
      else
        format.html { render :edit }
        format.json { render json: @configuration_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configuration_files/1
  # DELETE /configuration_files/1.json
  def destroy
    @configuration_file.destroy
    respond_to do |format|
      format.html { redirect_to configuration_files_url, notice: 'Configuration file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configuration_file
      @configuration_file = ConfigurationFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def configuration_file_params
      params.require(:configuration_file).permit(:configuration_template_id, :version, :file_content)
    end
end
