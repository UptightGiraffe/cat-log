class PetsController < ApplicationController

  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @pets = Pet.paginate(page: params[:page], per_page: 3)
    @cat_emoji = cat_emoji_list
  end

  def show

  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(from_param)
    @pet.user = current_user
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
      flash[:notice] = "Kitty Moment \"#{@pet.name}\" was updated sucessfully."
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

  def require_same_user
    if current_user != @pet.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own kitty moment!"
      redirect_to @pet
    end
  end

end
