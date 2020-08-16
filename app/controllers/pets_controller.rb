class PetsController < ApplicationController

  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.paginate(page: params[:page], per_page: 4)
    @cat_emoji = cat_emoji_list
  end

  def show

  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(from_param)
    # @pet.photo.attach(params[:photo])
    if @pet.save
      flash[:notice] = "Pet \"#{@pet.name}\" was saved sucessfully."
      redirect_to pets_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    # @pet.photo.attach(params[:photo])
    if @pet.update(from_param)
      flash[:notice] = "Pet \"#{@pet.name}\" was updated sucessfully."
      redirect_to pets_path
    else
      render 'edit'
    end
  end

  def destroy

    @pet.destroy
    redirect_to pets_path
  end

  private

  def from_param
    params.require(:pet).permit(:name, :description, :photo)
  end

  def set_pet
    @pet = Pet.find(params[:id])
    @cat_emoji = cat_emoji_list
  end

end
