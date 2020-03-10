class PigeonsController < ApplicationController
  def index
    @pigeons = policy_scope(Pigeon)
  end

  def new
    @pigeon = Pigeon.new
    authorize @pigeon
  end

  def show
    @pigeon = Pigeon.find(params[:id])
    authorize @pigeon
  end

  def create
    @pigeon = Pigeon.new(pigeon_params)
    authorize @pigeon
    if @pigeon.save
      redirect_to pigeon_path(@pigeon)
    else
      render 'new'
    end
  end

  private

  def pigeon_params
    params.require(:pigeon).permit(:name, :breed, :km_per_hour, :price_per_km,:users_id)
  end
end
