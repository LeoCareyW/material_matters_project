class PartnersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_partner, only: [:show, :edit, :update, :destroy]
  def index
    @partners = policy_scope(Partner).order(created_at: :desc)
  end

  def new
    @partner = Partner.new
    authorize @partner
  end

  def create
    user_id = current_user
    @partner = Partner.new(partner_params)
    @partner.user_id = current_user
    authorize @partner
      if @partner.save
        redirect_to partner_path(@partner)
      else
        render :new
      end
  end

  def show
    @partner = Partner.find(params[:id])
  end

  def edit
    @partner = Partner.find(params[:id])
    authorize @partner
  end

  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy
    redirect_to partners_path, notice: "The partner #{@partner.name} has been deleted."
  end

  def update
    @partner = Partner.find(params[:id])
    @partner.update(partner_params)

    if @partner.save
      redirect_to partner_path(@partner)
    else
      render :new
    end
  end

  private

  def set_partner
    @partner = Partner.find(params[:id])
    authorize @partner
  end

  def partner_params
    params.require(:partner).permit(:name, :description, :link, :instagram, :linkedin, photos: [])
  end
end
