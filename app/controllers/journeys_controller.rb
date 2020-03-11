class JourneysController < ApplicationController
  def create
    @pigeon = Pigeon.find(params[:pigeon_id])
    @journey = Journey.new(params_journey)
    @journey.user = current_user
    @journey.pigeon = @pigeon
    if @journey.save
      redirect_to dashboard_path(@pigeon)
    else
      render "pigeons/show"
      flash[:alert] = "Your are not connected !"
    end
  end

  private

  def params_journey
    params.require(:journey).permit(:arrival_address, :arrival_date, :message)
  end
end
