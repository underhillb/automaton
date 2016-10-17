class BlueprintsController < ApplicationController
  before_action :set_blueprint, only: [:show, :edit, :update, :destroy]

  # GET /blueprints
  # GET /blueprints.json
  def index
    @blueprints = Blueprint.all
    respond_to do |format|
      format.html
      format.json {
        blueprints=Blueprint.all
        .where("name LIKE ?", "%#{params[:name]}%")
        .where("description LIKE ?", "%#{params[:description]}%").includes(:blueprint_objects)
        data=[]
        blueprints.each do |bp|
          d={
            :name => bp.name,
            :description => bp.description,
            :id => bp.id,
            :version => bp.version,
            :group => bp.group,
            :user => bp.user.full_name,
            :blueprint_objects => bp.blueprint_objects
          }
          data  <<d

        end
        render json: {'value' => data}
      }
      #.where("name LIKE ?", "%#{params[:name]}%")
    end
  end

  # GET /blueprints/1
  # GET /blueprints/1.json
  def show
  end

  # GET /blueprints/new
  def new
    @blueprint = Blueprint.new
  end

  # GET /blueprints/1/edit
  def edit
  end

  # POST /blueprints
  # POST /blueprints.json
  def create
    if params[:name].blank?
      @blueprint = Blueprint.new(blueprint_params)

    else
      @blueprint = Blueprint.new(name: params[:name], description: params[:description])

    end
    @blueprint.user=current_user
    respond_to do |format|
      if @blueprint.save
        format.html { redirect_to @blueprint, notice: 'Blueprint was successfully created.' }
        format.json { render json: @blueprint }
      else
        puts  @blueprint.errors.inspect
        format.html { render :new }
        format.json { render json: @blueprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blueprints/1
  # PATCH/PUT /blueprints/1.json
  def update
    if params[:name].blank?
      updated=@blueprint.update(blueprint_params)
    else
      updated=@blueprint.update(name: params[:name], description: params[:description])
    end
    respond_to do |format|
      if updated
        format.html { redirect_to @blueprint, notice: 'Blueprint was successfully updated.' }
        format.json { render json: @blueprint         }
      else
        puts @blueprint.errors.inspect
        format.html { render :edit }
        format.json { render json: @blueprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blueprints/1
  # DELETE /blueprints/1.json
  def destroy
    @blueprint.destroy
    respond_to do |format|
      format.html { redirect_to blueprints_url, notice: 'Blueprint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_blueprint
    @blueprint = Blueprint.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def blueprint_params
    params.require(:blueprint).permit(:name, :description, :version, :user_id, :group, blueprint_objects_attributes: [:id, :configuration_template_id,:configuration_file_id, :object_type_id, :catalog_item_id, :blueprint_id, :name, :description,  :_destroy,:version])
  end
end
