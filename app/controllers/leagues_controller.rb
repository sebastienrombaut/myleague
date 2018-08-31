class LeaguesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_league, only: %i[show_players show display_players add_players display_new_match new_match match_history leaderboard]

  def index
    @leagues = League.all
  end

  def edit; end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    @league.name = params[:league][:name]
    @league.sport = params[:league][:sport]

    if @league.save
      flash[:success] = "You have successfully created a league :)"
      redirect_to @league
    else
      flash[:error] = "Your league has not been created :/"
      redirect_to new_league_path
    end
  end

  def show; end

  def show_players
    @players = @league.players
  end

  def display_players
    @players = @league.players
  end

  def add_players
    @players = @league.players
    @player_chosen = Player.find_by(name: params[:player_chosen])
    @players << @player_chosen
    flash[:success] = "You have successfully added this #{@player_chosen.name} to #{@league.name} :)"
    redirect_to @league
  end

  def display_new_match
    @match = Match.new
  end

  def new_match
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
      flash[:error] = 'Your match has not been created, because #{@match.errors.full_messages}'
      redirect_to display_new_match_league_path
    end
  end

  def match_history
    @matches = Match.where(league_id: @league.id).recent_sort
  end

  def leaderboard
    @players = @league.players
    @ratios = Player.array_of_ratios(@players, @league)
  end

  private

  def league_params
    params.require(:league).permit(:name, :sport)
  end

  def set_league
    @league = League.find(params[:id])
  end
end
