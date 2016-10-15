class ObjectTypesController < ApplicationController
  before_action :set_object_type, only: [:show, :edit, :update, :destroy]

  # GET /object_types
  # GET /object_types.json
  def index
    respond_to do |format|
      format.html
      format.json {
        data= ObjectType.all
        .where("name LIKE ?", "%#{params[:name]}%")
        .where("description LIKE ?", "%#{params[:description]}%")
        render json: {'value' => data} }
      end
    end
    # GET /object_types/1
    # GET /object_types/1.json

    # POST /object_types
    # POST /object_types.json
    def create
      data = ObjectType.new(name: params[:name], description: params[:description])
      data.save
      render json: data
    end

    # PATCH/PUT /object_types/1
    # PATCH/PUT /object_types/1.json
    def update
      respond_to do |format|
        if @object_type.update(name: params[:name], description: params[:description])
          format.json { render json: @object_type }
        end
      end
    end

    # DELETE /object_types/1
    # DELETE /object_types/1.json
    def destroy
      @object_type.destroy
      render nothing: true, status: 200
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
