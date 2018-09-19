class PlayersController < ApplicationController
  before_action :authenticate_admin!

  def show

  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      flash[:success] = "The player's name has been edited"
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end
