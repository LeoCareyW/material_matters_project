class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  def index
    @teams = policy_scope(Team)
  end

  def new
    @team = Team.new
    authorize @team
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user
    authorize @team
      if @team.save
        redirect_to team_path(@team)
      else
        render :new
      end
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
    authorize @team
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_path, notice: "This person has been deleted."
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)

    if @team.save
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  private

  def set_team
    @team = Team.find(params[:id])
    authorize @team
  end

  def team_params
    params.require(:team).permit(:name, :description, :role, photos: [])
  end
end
