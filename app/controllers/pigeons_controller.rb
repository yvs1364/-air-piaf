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
<<<<<<< HEAD
      redirect_to pigeon_path(@pigeon)
    else
      render 'new'
=======
      redirect_to dashboard_path
    else
      render :new
>>>>>>> be5c36624f2030ad71d9ed487e329f5f47806a16
    end
  end

  private

  def pigeon_params
<<<<<<< HEAD
    params.require(:pigeon).permit(:name, :breed, :km_per_hour, :price_per_hour,:users_id)
=======
    params.require(:pigeon).permit(:name, :breed, :km_per_hours, :price_per_hour,:users_id) #rajouter photo

>>>>>>> be5c36624f2030ad71d9ed487e329f5f47806a16
  end
end
