class PigeonsController < ApplicationController
  def index
    @pigeons = Pigeon.all


    @markers = @pigeons.map do |pigeon|
      {
        lat: pigeon.latitude,
        lng: pigeon.longitude,
        infowindow: render_to_string(partial: "info_window", locals: { pigeon: pigeon }),
        image_url: helpers.asset_url('piaf.png')
      }
    end
  end

  def new
    @pigeon = Pigeon.new
  end

  def show
    @pigeon = Pigeon.find(params[:id])
    @journey = Journey.new
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
    params.require(:pigeon).permit(:name, :breed, :km_per_hour, :price_per_km,:users_id)
  end
end
