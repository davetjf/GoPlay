class DoublesController < ApplicationController
  before_action :set_double, only: [:show, :edit, :update, :destroy]

  # GET /doubles
  # GET /doubles.json
  def index
    if current_user.blocked == true
      redirect_to '/contacts/new'
      flash[:notice] = "You have been blocked! Please contact the admin if you think this is an error"
    else    
    @doubles = Double.all
    @email = current_user.email
  end
  end

  def confirm_one
    @double = Double.find_by(id: params[:id])
    @double.update_attribute(:confirm_one, 1)
    redirect_to "/my_games"
  end
  def confirm_two
    @double = Double.find_by(id: params[:id])
    @double.update_attribute(:confirm_two, 1)
    redirect_to "/my_games"
  end
  def confirm_three
    @double = Double.find_by(id: params[:id])
    @double.update_attribute(:confirm_three, 1)
    redirect_to "/my_games"
  end  

  # GET /doubles/1
  # GET /doubles/1.json
  def show
    redirect_to '/my_games'
  end

  # GET /doubles/new
  def new
    if current_user.blocked == true
      redirect_to '/contacts/new'
      flash[:notice] = "You have been blocked! Please contact the admin if you think this is an error"
    else
    @double = Double.new
    @users = User.all
    @email = current_user.email
    @game_names = GameName.all
    end
  end

  # GET /doubles/1/edit
  def edit
    if current_user.blocked == true
      redirect_to '/contacts/new'
      flash[:notice] = "You have been blocked! Please contact the admin if you think this is an error"
    else
    @users = User.all
    @game_names = GameName.all
    end
  end

  # POST /doubles
  # POST /doubles.json
  def create
    @double = Double.new(double_params)

    respond_to do |format|
      if @double.save
        format.html { redirect_to '/my_games', notice: 'Double was successfully created.' }
        format.json { render :show, status: :created, location: '/my_games' }
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
        format.html { redirect_to '/my_games', notice: 'Double was successfully updated.' }
        format.json { render :show, status: :ok, location: '/my_games' }
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
      format.html { redirect_to '/lb', notice: 'Double was successfully destroyed.' }
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
