class NotesController < ApplicationController
  
  before_action :set_note, only: [:show, :edit, :update, :delete ]

  def index
    @notes = Note.all
  end

  def show
  end

  def new
    @products = Product.all
    @note = Note.new
  end

  def edit
    @products = Product.all
  end

  def create
    @products = Product.all
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note, notice: "Note was successfully created"
    else
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
      params.require(:note).permit(:name)
    end
end
