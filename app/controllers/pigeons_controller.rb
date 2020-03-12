# frozen_string_literal: true

class PigeonsController < ApplicationController
  def index

    grow = 1
    scope = 10 * grow
    if params[:query].present?
      results = Pigeon.near(params[:query], scope).order(:distance)
      while results.empty?
        grow += 2
        scope += 20 * grow
        results = Pigeon.near(params[:query], scope, units: :km).order(:distance).limit(3)
      end
      @pigeons = results

    else
      @pigeons = Pigeon.all

  end

    @markers = @pigeons.map do |pigeon|
      {
        lat: pigeon.latitude,
        lng: pigeon.longitude,
        infowindow: render_to_string(partial: "info_window", locals: { pigeon: pigeon }),
        image_url: helpers.asset_url("piaf.png")
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
    @pigeon.user_id = current_user.id
    if @pigeon.save
      redirect_to pigeon_path(@pigeon)

    else
      raise
      render "new"
    end
  end

  private

  def pigeon_params
    params.require(:pigeon).permit(:name, :breed, :km_per_hour, :price_per_km, :user_id, :address)
  end
end
