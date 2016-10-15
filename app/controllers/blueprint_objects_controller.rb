class BlueprintObjectsController < ApplicationController
  before_action :set_blueprint_object, only: [:show, :edit, :update, :destroy]

  # GET /blueprint_objects
  # GET /blueprint_objects.json
  def index
    @blueprint_objects = BlueprintObject.all
  end

  # GET /blueprint_objects/1
  # GET /blueprint_objects/1.json
  def show
  end

  # GET /blueprint_objects/new
  def new
    @blueprint_object = BlueprintObject.new
  end

  # GET /blueprint_objects/1/edit
  def edit
  end

  # POST /blueprint_objects
  # POST /blueprint_objects.json
  def create
    @blueprint_object = BlueprintObject.new(blueprint_object_params)

    respond_to do |format|
      if @blueprint_object.save
        format.html { redirect_to @blueprint_object, notice: 'Blueprint object was successfully created.' }
        format.json { render :show, status: :created, location: @blueprint_object }
      else
        format.html { render :new }
        format.json { render json: @blueprint_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blueprint_objects/1
  # PATCH/PUT /blueprint_objects/1.json
  def update
    respond_to do |format|
      if @blueprint_object.update(blueprint_object_params)
        format.html { redirect_to @blueprint_object, notice: 'Blueprint object was successfully updated.' }
        format.json { render :show, status: :ok, location: @blueprint_object }
      else
        format.html { render :edit }
        format.json { render json: @blueprint_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blueprint_objects/1
  # DELETE /blueprint_objects/1.json
  def destroy
    @blueprint_object.destroy
    respond_to do |format|
      format.html { redirect_to blueprint_objects_url, notice: 'Blueprint object was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blueprint_object
      @blueprint_object = BlueprintObject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blueprint_object_params
      params.require(:blueprint_object).permit(:object_type_id, :catalog_item_id, :blueprint_id, :name, :description, :version)
    end
end
