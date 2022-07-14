class WarehouseRecordsController < ApplicationController
  load_and_authorize_resource
  before_action :set_warehouse_record, only: [ :show, :edit, :update, :destroy ]

  def index
    @warehouse_records = WarehouseRecord.all
  end

  def show
  end

  def new
    @products = Product.all
    @warehouse_record = WarehouseRecord.new
  end
  
  def edit
    @products = Product.all
    @warehouse_records = NoteProduct.all
  end
 
  def create
    @warehouse_record = WarehouseRecord.new(warehouse_record_params)
      if @warehouse_record.save
        redirect_to @warehouse_record, notice: "Warehouse record was successfully created."
      else
        @products = Product.all
        @warehouse_records = NotesProduct.all
        render :new, status: :unprocessable_entity
      end
  end

  def update
      if @warehouse_record.update(warehouse_record_params)
        redirect_to @warehouse_record, notice: "Warehouse record was successfully updated." 
      else
        render "edit"
      end
  end

  def destroy
    @warehouse_record.destroy
    redirect_to warehouse_records_path, status: :see_other, notice: "Warehouse record was successfully destroyed." 
    
  end

  private
    def set_warehouse_record
      @warehouse_record = WarehouseRecord.find(params[:id])
    end

    def warehouse_record_params
      params.require(:warehouse_record).permit(:quantity, warehouse_details_attributes: [:id, :quantity, :product_id, :warehouse_record_id, :_destroy])
    end
end
