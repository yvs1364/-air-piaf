class PigeonsController < ApplicationController
  def index
    @pigeons = Pigeon.all
  end

  def new
    @pigeon = Pigeon.new
  end

  def show
    @user = current_user
    @pigeon = Pigeon.find(params)
    @journey = Journey.new
  end

  def create
    @pigeon = Pigeon.new(pigeon_params)
    if @pigeon.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def pigeon_params
    params.require(:pigeon).permit(:name, :breed, :km_per_hours, :price_per_hour,:users_id) #rajouter photo

  end
end
