class ProductsController < ApplicationController
  load_and_authorize_resource 
  before_action :set_product, only: [ :show, :edit, :update, :destroy ]

  def index
    @products = Product.all
  end
  
  def show
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def edit
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @product = Product.new(product_params)
    
    if @product.save
      redirect_to @product, notice: "Product was successfully created." 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated."
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    if NoteProduct.exists?(product_id: @product.id)
      # Si existen, muestra un mensaje de error
      flash[:alert] = "No se puede eliminar el producto porque está relacionado con notas."
      redirect_to products_path
    else
      # Si no existen, procede a eliminar el producto
      @product.destroy
      flash[:notice] = "Producto eliminado correctamente."
      redirect_to products_path
    end
  end

  def delete_photos_attachment    
    @photo = ActiveStorage::Blob.find(params[:asset_id])
    @photo.attachments.first.purge
    redirect_back(fallback_location: products_path)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:photo, :name, :cost, :description, :stock, :markup_percentage, :price, :category_id)
    end
end
