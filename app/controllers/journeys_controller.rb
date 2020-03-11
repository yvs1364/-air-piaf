class JourneysController < ApplicationController
  def create
    @pigeon = Pigeon.find(params[:pigeon_id])
    @journey = Journey.new(params_journey)
    @journey.user = current_user
    @journey.pigeon = @pigeon
      if @journey.save
        redirect_to dashboard_path(@pigeon)
      else
        render "pigeon_path" #page pigeon_id
      end
  end

  private

  def params_journey
    params.require(:journey).permit(:user_id, :pigeon_id, :arrival_address,
      :total_price, :arrival_date, :message)
  end
end
