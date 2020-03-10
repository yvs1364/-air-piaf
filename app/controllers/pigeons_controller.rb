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
  end

  private

  def pigeon_params
    params.require(:pigeon).permit(:name, :breed, :km_per_hours, :price_per_hour,:users_id)

  end
end
