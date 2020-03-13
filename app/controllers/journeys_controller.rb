# frozen_string_literal: true

class JourneysController < ApplicationController
  def create
    @pigeon = Pigeon.find(params[:pigeon_id])
    @journey = Journey.new(params_journey)
    @journey.user = current_user
    @journey.pigeon = @pigeon
    @journey.geocode
    @distance = @pigeon.distance_to([@journey.latitude, @journey.longitude])
    @journey.total_price = @distance * @pigeon.price_per_km
    @duration = (@distance / @pigeon.km_per_hour) * 2
    @duration_one_way = @duration / 2
    @journey.return_date = Time.now + @duration.hours
    @journey.arrival_date = Time.now  + @duration_one_way.hours
    @pigeon.available = false
    @pigeon.save
    if @journey.save
      redirect_to dashboard_path(@pigeon)
    else
      render "pigeons/show"
      flash[:alert] = "Your are not connected !"
    end
    authorize @journey
  end

  private

  def params_journey
    params.require(:journey).permit(:arrival_address, :return_date, :message)
  end
end
