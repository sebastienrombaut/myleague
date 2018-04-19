class LeaguesController < ApplicationController
  before_action :authenticate_player!

  def index
  	@leagues = League.all
  end

  def edit
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    @league.name = params[:league][:name]
    @league.sport = params[:league][:sport]
    @league.players << current_player

    if @league.save 
      flash[:success] = "You have successfully created a league :)"
      redirect_to @league
    else
      flash[:error] = "Your league has not been created :/"
      redirect_to new_league_path
    end
  end


  def show
    @league = League.find(params[:id])
  end

  def show_players
    @league = League.find(params[:id])
    @players = @league.players
  end

  def display_players
    @league = League.find(params[:id])
    @players = @league.players
  end

  def add_players
    @league = League.find(params[:id])
    @players = @league.players
    @player_chosen = Player.find_by(name: params[:player_chosen])
    @players << @player_chosen
    flash[:success] = "You have successfully added this #{@player_chosen.name} to #{@league.name} :)"
    redirect_to @league
  end

  def display_new_match
    @league = League.find(params[:id])
    @match = Match.new

  end

  def new_match
    @league = League.find(params[:id])
    @match = Match.new
    @match.league_id = @league.id
    @player1 = Player.find_by(name: params[:player1_chosen])
    @match.player1_id = @player1.id
    @player2 = Player.find_by(name: params[:player2_chosen])
    @match.player2_id = @player2.id
    @match.score1 = params[:score1]
    @match.score2 = params[:score2]
    @match.comment = params[:comment]
    if @match.save
      flash[:success] = "You have successfully created a match :)"
    redirect_to @league
    else
      flash[:error] = 'Your match has not been created'
    redirect_to display_new_match_league_path
    end
  end

  def match_history
    @league = League.find(params[:id])
    @matches = Match.where(league_id: @league.id).recent_sort
  end

  def leaderboard
    @players = League.find(params[:id]).players
  end


  private 

  def league_params
    params.require(:league).permit(:name, :sport)
  end
end
