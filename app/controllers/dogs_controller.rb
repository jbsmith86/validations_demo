class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      flash[:notice] = "Successfully created dog."
      redirect_to dogs_url
    else
      render 'new'
    end
  end

  def update
    @dog = Dog.find(params[:id])

    if @dog.update(dog_params)
      flash[:notice] = "Successfully saved dog."
      redirect_to dogs_url
    else
      render 'edit'
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy

    flash[:notice] = "Deleted dog."

    redirect_to dogs_url
  end

  private
  def dog_params
    params.require(:dog).permit(:name, :color, :age)
  end
end
