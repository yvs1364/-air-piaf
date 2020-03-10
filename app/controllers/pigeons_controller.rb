class PigeonsController < ApplicationController
  def index
    @pigeons = pigeon.all
  end

  def new
    @pigeon = Pigeon.new
  end

  def show
    @pigeon = Restaurant.find(params[:id])
  end

  def create
  end

  private

  def pigeon_params
    params.require(:pigeon).permit(:breed)

  end
end
