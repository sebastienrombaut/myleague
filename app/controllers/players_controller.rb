class PlayersController < ApplicationController
  before_action :authenticate_admin!

  def show
  end

  def edit
    @player = Player.find(params[:league_id])
  end

  def update
    @player = Player.find(params[:league_id])
    if @player.update(name: params[:name])
      flash[:success] = "The player's name has been edited"
      redirect_to leagues_path
    else
      render 'edit'
    end
  end
end
