class MatchesController < ApplicationController
  before_action :authenticate_admin!

  def edit
    @match = Match.find(params[:league_id])

    @tab_name = []
    League.find_by(name: params[:id]).players.each do |player|
      @tab_name << player.name
    end
  end

  def update
    @match = Match.find(params[:league_id])
    @league = League.find_by(name: params[:id])

    if @match.update(
        player1_id: @league.players.find_by(name: params[:player1_chosen]).id,
        player2_id: @league.players.find_by(name: params[:player2_chosen]).id,
        score1: params[:score1],
        score2: params[:score2],
        comment: params[:comment],
      )
      flash[:success] = "The match has been edited"
      redirect_to leagues_path
    else
      render edit_match_league_path
    end
  end
end
