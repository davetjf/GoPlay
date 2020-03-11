class MyGamesController < ApplicationController
  before_action :set_my_game, only: [:show, :edit, :update, :destroy]

  # GET /my_games
  # GET /my_games.json
  def index
    @my_games = MyGame.all.order("date ASC")
    @doubles = Double.all.order("date ASC")
    @users = User.all
  end

  def leaderboard
    @my_games = MyGame.all
    @users = User.all
    @doubles = Double.all
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
