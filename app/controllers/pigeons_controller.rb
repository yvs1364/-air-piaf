# frozen_string_literal: true

class PigeonsController < ApplicationController
  def index
    @pigeons = policy_scope(Pigeon).order(created_at: :desc)
    grow = 1
    scope = 10 * grow
    if params[:query].present?
      results = Pigeon.near(params[:query], scope).order(:distance)
      while results.empty?
        grow += 2
        scope += 20 * grow
        results = Pigeon.near(params[:query], scope, units: :km).order(:distance).limit(4)
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
    @pigeon = policy_scope(Pigeon).order(created_at: :desc)
    @pigeon = Pigeon.new
    authorize @pigeon
  end

  def show
    @pigeon = policy_scope(Pigeon).order(created_at: :desc)

    @pigeon = Pigeon.find(params[:id])
    @journey = Journey.new
    authorize @pigeon
  end

  def create
    @pigeon = policy_scope(Pigeon).order(created_at: :desc)

    @pigeon = Pigeon.new(pigeon_params)
    @pigeon.user_id = current_user.id
    if @pigeon.save
      redirect_to dashboard_path(@pigeon)
    else
      render "new"
    end
    authorize @pigeon
  end

  def destroy
    @pigeon = Pigeon.find(params[:id])
    @pigeon.destroy
        authorize @pigeon

    redirect_to pigeons_path
  end

  private

  def pigeon_params
    params.require(:pigeon).permit(:name, :breed, :km_per_hour, :price_per_km, :user_id, :address, :photo)
  end
end
