class GatheringsController < ApplicationController
  before_action :set_gathering, only: [:show, :edit, :update, :destroy]
  def index
    @gatherings = policy_scope(Gathering)
  end

  def new
    @gathering = Gathering.new
    authorize @gathering
  end

  def create
    @gathering = Gathering.new(gathering_params)
    authorize @gathering
      if @gathering.save
        redirect_to gathering_path(@gathering)
      else
        render :new
      end
  end

  def show
    @gathering = Gathering.find(params[:id])
  end

  def edit
    @gathering = Gathering.find(params[:id])
  end

  def destroy
    @gathering = Gathering.find(params[:id])
    @gathering.destroy
    redirect_to gatherings_path, notice: "The event #{@gathering.title} has been deleted."
  end

  def update
    @gathering = Gathering.find(params[:id])
    @gathering.update(gathering_params)

    if @gathering.save
      redirect_to gathering_path(@gathering)
    else
      render :new
    end
  end

  private

  def set_gathering
    @gathering = Gathering.find(params[:id])
    authorize @gathering
  end

  def gathering_params
    params.require(:gathering).permit(:title, :category, :description, :date, photos: [])
  end
end
