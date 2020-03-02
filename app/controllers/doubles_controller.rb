class DoublesController < ApplicationController
  before_action :set_double, only: [:show, :edit, :update, :destroy]

  # GET /doubles
  # GET /doubles.json
  def index
    @doubles = Double.all.order("date ASC")
    @email = current_user.email
  end

  # GET /doubles/1
  # GET /doubles/1.json
  def show
  end

  # GET /doubles/new
  def new
    @double = Double.new
    @users = User.all
    @email = current_user.email
    @game_names = GameName.all
   
  end

  # GET /doubles/1/edit
  def edit
  end

  # POST /doubles
  # POST /doubles.json
  def create
    @double = Double.new(double_params)

    respond_to do |format|
      if @double.save
        format.html { redirect_to '/my_games', notice: 'Double was successfully created.' }
        format.json { render :show, status: :created, location: @double }
      else
        format.html { render :new }
        format.json { render json: @double.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /doubles/1
  # PATCH/PUT /doubles/1.json
  def update
    respond_to do |format|
      if @double.update(double_params)
        format.html { redirect_to @double, notice: 'Double was successfully updated.' }
        format.json { render :show, status: :ok, location: @double }
      else
        format.html { render :edit }
        format.json { render json: @double.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doubles/1
  # DELETE /doubles/1.json
  def destroy
    @double.destroy
    respond_to do |format|
      format.html { redirect_to doubles_url, notice: 'Double was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_double
      @double = Double.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def double_params
      params.require(:double).permit(:game_name, :date, :player_one, :player_two, :player_three, :player_four, :result)
    end
end
