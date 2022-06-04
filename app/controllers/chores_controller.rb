class ChoresController < ApplicationController
  def index
    @chores = Chore.all
  end

  def show
    @chore = Chore.find(params[:id])
  end

  def new
    @chore = Chore.new
  end

  def create
    @chore = Chore.new(chore_params)
    if @chore.save
      redirect_to @chore
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @chore = Chore.find(params[:id])
  end

  def update
    @chore = Chore.find(params[:id])
    if @chore.update(chore_params)
      redirect_to @chore
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy
    redirect_to chores_path, status: :see_other
  end

  private

  def chore_params
    params.require(:chore).permit(:title, :description)
  end
end
