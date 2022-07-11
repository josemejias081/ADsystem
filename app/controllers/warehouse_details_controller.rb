class WarehouseDetailsController < ApplicationController
  before_action :set_warehouse_detail, only: [ :show, :edit, :update, :destroy ]

  def index
    @warehouse_details = WarehouseDetail.all
  end
  
  def show
  end

  def new
    @warehouse_detail = WarehouseDetail.new
  end

  def edit
  end

  def create
    @warehouse_detail = WarehouseDetail.new(warehouse_detail_params)
    if @warehouse_detail.save
      redirect_to @warehouse_detail, notice: "Warehouse detail was successfully created."
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    if @warehouse_detail.update(warehouse_detail_params)
      redirect_to @warehouse_detail, notice: "Warehouse detail was successfully updated."
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @warehouse_detail.destroy
    redirect_to warehouse_details_path, status: :see_other, notice: "Warehouse detail was successfully destroyed."
  end

  private
    def set_warehouse_detail
      @warehouse_detail = WarehouseDetail.find(params[:id])
    end

    def warehouse_detail_params
      params.require(:warehouse_detail).permit(:quantity, :product_id, :warehouse_record_id)
    end
end
