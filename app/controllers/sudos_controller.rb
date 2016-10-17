class SudosController < ApplicationController
  before_action :set_sudo, only: [:show, :edit, :update, :destroy]

  # GET /sudos
  # GET /sudos.json
  def index
    respond_to do |format|
      format.html
      format.json {
        data=Sudo.all
        .where("name LIKE ?", "%#{params[:name]}%")
        .where("description LIKE ?", "%#{params[:description]}%")
        .where("sudo_rule LIKE ?", "%#{params[:sudo_rule]}%")
        render json: {'value' => data}
      }
      #.where("name LIKE ?", "%#{params[:name]}%")
    end
  end
  def create
    data = Sudo.new(name: params[:name], description: params[:description],sudo_rule: params[:sudo_rule])
    if data.save
    render json: data
    end
  end

  # PATCH/PUT /configuration_detail_types/1
  # PATCH/PUT /configuration_detail_types/1.json
  def update
    respond_to do |format|
      if @sudo.update(name: params[:name], description: params[:description],sudo_rule: params[:sudo_rule])
        format.json { render json: @sudo }
      end
    end
  end

  # DELETE /configuration_detail_types/1
  # DELETE /configuration_detail_types/1.json
  def destroy
    if @sudo.destroy
      head :ok
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sudo
      @sudo = Sudo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sudo_params
      params.require(:sudo).permit(:name, :description, :sudo_rule)
    end
end
