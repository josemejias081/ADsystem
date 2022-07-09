class NotesController < ApplicationController
  
  before_action :set_note, only: [:show, :edit, :update, :destroy ]

  def index
    @notes = Note.all
  end

  def show
  end

  def new
    @notes_products = NotesProduct.all
    @products = Product.all
    @note = Note.new
   
  end

  def edit
    @products = Product.all
    @notes_products = NotesProduct.all
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note, notice: "Note was successfully created"
    else
      @notes_products = NotesProduct.all
      @products = Product.all
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @note.update(note_params)
      redirect_to @note, notice: "Note was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path, status: :see_other, notice: "Note was successfully destroyed."
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:id, :name, notes_products_attributes: [:id, :quantity, :product_id, :note_id, :_destroy])
    end
end
