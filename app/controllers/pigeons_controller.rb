class PigeonsController < ApplicationController
  def index
    @pigeons = Pigeon.all
  end

  def new
    @pigeon = Pigeon.new
  end

  def show
    @pigeon = Pigeon.find(params)
  end

  def create
    @pigeon = Pigeon.new(pigeon_params)
    if @pigeon.save
      redirect_to pigeon_path(@pigeon)
    else
      render 'new'
    end
  end

  private

  def pigeon_params
    params.require(:pigeon).permit(:name, :breed, :km_per_hour, :price_per_hour,:users_id)
  end
end
