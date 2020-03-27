class MyGamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_my_game, only: [:show, :edit, :update, :destroy]

  # GET /my_games
  # GET /my_games.json
  def index
    @my_games = MyGame.all
    @doubles = Double.all
    @users = User.all
  end

  def confirm
    @game = MyGame.find_by(id: params[:id])
    @game.update_attribute(:confirm, 1)
    redirect_to "/my_games"
  end







  def leaderboard
    @my_games = MyGame.all
    @users = User.all
    @doubles = Double.all

    #singles pool leaderboard

    @poolLeaderboardW = MyGame.all.group(:player_one).where("result = 'Win' AND game_name = 'Pool' AND confirm = 1 ").count.sort_by {|k,v| -v}
    @poolLeaderboardL = MyGame.all.group(:player_one).where("result = 'Lose' AND game_name = 'Pool' AND confirm = 1 ").count.sort_by {|k,v| -v}
    #@poolLeaderboardNP = MyGame.all.group(:player_one).where("result = 'Yet to be played' AND game_name = 'Pool' AND confirm = 1 ").count.sort_by {|k,v| -v}
    @totalp = MyGame.all.group(:player_one).where("game_name = 'Pool' AND confirm = 1 ").count.sort_by {|k,v| -v}
  
    
    # singles table tennis leaderboard
    @ttLeaderboardW = MyGame.all.group(:player_one).where("result = 'Win' AND game_name = 'Table Tennis' AND confirm = 1 ").count.sort_by {|k,v| -v}
    @ttLeaderboardL = MyGame.all.group(:player_one).where("result = 'Lose' AND game_name = 'Table Tennis' AND confirm = 1 ").count.sort_by {|k,v| -v}
    #@ttLeaderboardNP = MyGame.all.group(:player_one).where("result = 'Yet to be played' AND game_name = 'Table Tennis' AND confirm = 1 ").count.sort_by {|k,v| -v}
    @totaltt = MyGame.all.group(:player_one).where("game_name = 'Table Tennis' AND confirm = 1 ").count.sort_by {|k,v| -v}    

    # singles fuseball leaderboard
    @fbLeaderboardW = MyGame.all.group(:player_one).where("result = 'Win' AND game_name = 'Fuseball' AND confirm = 1 ").count.sort_by {|k,v| -v}
    @fbLeaderboardL = MyGame.all.group(:player_one).where("result = 'Lose' AND game_name = 'Fuseball' AND confirm = 1 ").count.sort_by {|k,v| -v}
    #@fbLeaderboardNP = MyGame.all.group(:player_one).where("result = 'Yet to be played' AND game_name = 'Fuseball' AND confirm = 1 ").count.sort_by {|k,v| -v}
    @totalfb = MyGame.all.group(:player_one).where("game_name = 'Fuseball' AND confirm = 1 ").count.sort_by {|k,v| -v}
#***************************************************************************************************************
    # doubles pool leaderboard
    @poolLeaderboardWd = Double.all.group(:player_one).where("result = 'Win' AND game_name = 'Pool' AND confirm_one = 1 AND confirm_two = 1 AND confirm_three = 1 ").count.sort_by {|k,v| -v}
    @poolLeaderboardLd = Double.all.group(:player_one).where("result = 'Lose' AND game_name = 'Pool' AND confirm_one = 1 AND confirm_two = 1 AND confirm_three = 1 ").count.sort_by {|k,v| -v}
    #@poolLeaderboardNPd = Double.all.group(:player_one).where("result = 'Yet to be played' AND game_name = 'Pool' AND confirm_one = 1 AND confirm_two = 1 AND confirm_three = 1 ").count.sort_by {|k,v| -v}
    @totalpd = Double.all.group(:player_one).where("game_name = 'Pool'AND confirm_one = 1 AND confirm_two = 1 AND confirm_three = 1 ").count.sort_by {|k,v| -v}

    # doubles table tennis leaderboard
    @ttLeaderboardWd = Double.all.group(:player_one).where("result = 'Win' AND game_name = 'Table Tennis' AND confirm_one = 1 AND confirm_two = 1 AND confirm_three = 1 ").count.sort_by {|k,v| -v}
    @ttLeaderboardLd = Double.all.group(:player_one).where("result = 'Lose' AND game_name = 'Table Tennis' AND confirm_one = 1 AND confirm_two = 1 AND confirm_three = 1 ").count.sort_by {|k,v| -v}
    #@ttLeaderboardNPd = Double.all.group(:player_one).where("result = 'Yet to be played' AND game_name = 'Table Tennis' AND confirm_one = 1 AND confirm_two = 1 AND confirm_three = 1 ").count.sort_by {|k,v| -v}
    @totalttd = Double.all.group(:player_one).where("game_name = 'Table Tennis' AND confirm_one = 1 AND confirm_two = 1 AND confirm_three = 1 ").count.sort_by {|k,v| -v}    

    # doubles fuseball leaderboard
    @fbLeaderboardWd = Double.all.group(:player_one).where("result = 'Win' AND game_name = 'Fuseball' AND confirm_one = 1 AND confirm_two = 1 AND confirm_three = 1 ").count.sort_by {|k,v| -v}
    @fbLeaderboardLd = Double.all.group(:player_one).where("result = 'Lose' AND game_name = 'Fuseball' AND confirm_one = 1 AND confirm_two = 1 AND confirm_three = 1 ").count.sort_by {|k,v| -v}
    #@fbLeaderboardNPd = Double.all.group(:player_one).where("result = 'Yet to be played' AND game_name = 'Fuseball' AND confirm_one = 1 AND confirm_two = 1 AND confirm_three = 1 ").count.sort_by {|k,v| -v}
    @totalfbd = Double.all.group(:player_one).where("game_name = 'Fuseball' AND confirm_one = 1 AND confirm_two = 1 AND confirm_three = 1 ").count.sort_by {|k,v| -v}




  end







  
  # GET /my_games/1
  # GET /my_games/1.json
  def show
  end

  # GET /my_games/new
  def new
    @users = User.all
    @email = current_user.email
    @game_names = GameName.all
    @my_game = MyGame.new
    
  end

  # GET /my_games/1/edit
  def edit
    @users = User.all
    @game_names = GameName.all
    
  end

  # POST /my_games
  # POST /my_games.json
  def create
    
    @my_game = MyGame.new(my_game_params)

    respond_to do |format|
      if @my_game.save
        format.html { redirect_to '/my_games', notice: 'My game was successfully created.' }
        format.json { render :show, status: :created, location: '/my_games' }
      else
        format.html { render :new }
        format.json { render json: @my_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_games/1
  # PATCH/PUT /my_games/1.json
  def update
    respond_to do |format|
      if @my_game.update(my_game_params)
        format.html { redirect_to '/my_games', notice: 'My game was successfully updated.' }
        format.json { render :show, status: :ok, location: '/my_games' }
      else
        format.html { render :edit }
        format.json { render json: @my_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_games/1
  # DELETE /my_games/1.json
  def destroy
    @my_game.destroy
    respond_to do |format|
      format.html { redirect_to my_games_url, notice: 'My game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_game
      @my_game = MyGame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def my_game_params
      params.require(:my_game).permit(:game_name, :game_type, :result, :date, :player_one, :player_two, :player_three, :player_four, :isPrivate)
    end
end
