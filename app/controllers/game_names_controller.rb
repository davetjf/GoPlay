class GameNamesController < ApplicationController
  before_action :set_game_name, only: [:show, :edit, :update, :destroy]

  # GET /game_names
  # GET /game_names.json
  def index
    @game_names = GameName.all
  end

  # GET /game_names/1
  # GET /game_names/1.json
  def show
  end

  # GET /game_names/new
  def new
    @game_name = GameName.new
  end

  # GET /game_names/1/edit
  def edit
  end

  # POST /game_names
  # POST /game_names.json
  def create
    @game_name = GameName.new(game_name_params)

    respond_to do |format|
      if @game_name.save
        format.html { redirect_to @game_name, notice: 'Game name was successfully created.' }
        format.json { render :show, status: :created, location: @game_name }
      else
        format.html { render :new }
        format.json { render json: @game_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_names/1
  # PATCH/PUT /game_names/1.json
  def update
    respond_to do |format|
      if @game_name.update(game_name_params)
        format.html { redirect_to @game_name, notice: 'Game name was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_name }
      else
        format.html { render :edit }
        format.json { render json: @game_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_names/1
  # DELETE /game_names/1.json
  def destroy
    @game_name.destroy
    respond_to do |format|
      format.html { redirect_to game_names_url, notice: 'Game name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_name
      @game_name = GameName.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_name_params
      params.require(:game_name).permit(:name)
    end
end
