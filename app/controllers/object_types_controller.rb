class ObjectTypesController < ApplicationController
  before_action :set_object_type, only: [:show, :edit, :update, :destroy]

  # GET /object_types
  # GET /object_types.json
  def index
    @object_types = ObjectType.all
  end

  # GET /object_types/1
  # GET /object_types/1.json
  def show
  end

  # GET /object_types/new
  def new
    @object_type = ObjectType.new
  end

  # GET /object_types/1/edit
  def edit
  end

  # POST /object_types
  # POST /object_types.json
  def create
    @object_type = ObjectType.new(object_type_params)

    respond_to do |format|
      if @object_type.save
        format.html { redirect_to @object_type, notice: 'Object type was successfully created.' }
        format.json { render :show, status: :created, location: @object_type }
      else
        format.html { render :new }
        format.json { render json: @object_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /object_types/1
  # PATCH/PUT /object_types/1.json
  def update
    respond_to do |format|
      if @object_type.update(object_type_params)
        format.html { redirect_to @object_type, notice: 'Object type was successfully updated.' }
        format.json { render :show, status: :ok, location: @object_type }
      else
        format.html { render :edit }
        format.json { render json: @object_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /object_types/1
  # DELETE /object_types/1.json
  def destroy
    @object_type.destroy
    respond_to do |format|
      format.html { redirect_to object_types_url, notice: 'Object type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_object_type
      @object_type = ObjectType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def object_type_params
      params.require(:object_type).permit(:name, :description)
    end
end
