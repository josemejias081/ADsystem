class EntitiesController < ApplicationController
  load_and_authorize_resource 
  before_action :set_client, only: [ :show, :edit, :update, :destroy ]

  def index
    @entities = Entity.all
  end

  def show
  end

  def new
    @entity = Entity.new
  end

  def edit
  end

  def create
    @entity = Entity.new(entity_params)
    if @entity.save
      redirect_to @entity, notice: "Entity was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    if @entity.update(entity_params)
      redirect_to @entity, notice: "Entity was successfully updated."
    else
      render "edit"
    end
  end

  def destroy
    @entity.destroy
    redirect_to entities_path, status: :see_other, notice: "Entity was successfully destroyed." 
  end

  private
    def set_client
      @entity = Entity.find(params[:id])
    end

    def entity_params
      params.require(:entity).permit(:name, :email, :phone, :address, :client, :supplier)
    end
end
