class PlayersController < ApplicationController
  before_action :authenticate_admin!

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

  def show
    @player = Player.find(params[:league_id])
    @league = League.find_by(name: params[:id])
    @players_tab = @league.players - [@player]
  end
end
