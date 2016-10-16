class CatalogItemsController < ApplicationController
  before_action :set_catalog_item, only: [:show, :edit, :update, :destroy]

  # GET /catalog_items
  # GET /catalog_items.json


    def index
      respond_to do |format|
        format.html
        format.json {
          data=CatalogItem.all
          .where("name LIKE ?", "%#{params[:name]}%")
          .where("description LIKE ?", "%#{params[:description]}%")
          render json: {'value' => data}
        }
        #.where("name LIKE ?", "%#{params[:name]}%")
      end
    end

    # GET /configuration_detail_types/1
    # GET /configuration_detail_types/1.json

    # GET /configuration_detail_types/new

    # POST /configuration_detail_types
    # POST /configuration_detail_types.json
    def create
      data = CatalogItem.new(name: params[:name], description: params[:description])
      data.save
      render json: data
    end

    # PATCH/PUT /configuration_detail_types/1
    # PATCH/PUT /configuration_detail_types/1.json
    def update
      respond_to do |format|
        if @catalog_item.update(name: params[:name], description: params[:description])
          format.json { render json: @catalog_item }
        end
      end
    end

    # DELETE /configuration_detail_types/1
    # DELETE /configuration_detail_types/1.json
    def destroy
      if @catalog_item.destroy
      head :ok
    end
    end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalog_item
      @catalog_item = CatalogItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalog_item_params
      params.require(:catalog_item).permit(:name, :description)
    end
end
