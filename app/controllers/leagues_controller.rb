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

  private 

  def league_params
    params.require(:league).permit(:name, :sport)
  end
end
