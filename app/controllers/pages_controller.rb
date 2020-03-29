class PagesController < ApplicationController
  def home
    
  	# Below code user to make the first admin
  	#current_user.update_attribute :admin, true
  end

  def dashboard

    if current_user.blocked == true
      redirect_to '/contacts/new'
      flash[:notice] = "You have been blocked! Please contact the admin if you think this is an error"
    else
      @posts=Post.all
        if  user_signed_in? == false 
        redirect_to '/users/sign_in'
        flash[:notice] = "You need to register or log in first"
        end
    end

  end




    def secretgame
    if current_user.blocked == true
      redirect_to '/contacts/new'
      flash[:notice] = "You have been blocked! Please contact the admin if you think this is an error"
    else
    if user_signed_in?
      @my_games = MyGame.all
      @gameCount = 0
      
      @my_games.each do |m| 
        if m.player_one == current_user.username && m.confirm == 1
          @gameCount = @gameCount + 1
        end
      end
      if @gameCount >= 10
      else
      redirect_to '/'
      flash[:notice] = "You can't go here just yet..."
      end
    else
      redirect_to '/'
      flash[:notice] = "You need to be signed in..."
    end
    end
  end

    def anothersecretgame
        if current_user.blocked == true
      redirect_to '/contacts/new'
      flash[:notice] = "You have been blocked! Please contact the admin if you think this is an error"
    else
    if user_signed_in?
      @doubles = Double.all
      @gameCount = 0
      
      @doubles.each do |d| 
        if d.player_one == current_user.username && d.confirm_one == 1 && d.confirm_two == 1 && d.confirm_three == 1
          @gameCount = @gameCount + 1
        end
      end
      if @gameCount >= 10
      else
      redirect_to '/'
      flash[:notice] = "You can't go here just yet..."
      end
    else
      redirect_to '/'
      flash[:notice] = "You need to be signed in..."
    end
  end
  end
	
  def allgames
    if user_signed_in? && current_user.admin?
      @my_games = MyGame.all.order("created_at DESC")
      @doubles = Double.all.order("created_at DESC")
    else
      redirect_to '/'
      flash[:notice] = "You don't have permissions to view this page."
    end

  end

  def allusers
    if  user_signed_in? && current_user.admin?
    @users = User.all
    else
    redirect_to '/'
    flash[:notice] = "You don't have permissions to view this page."
    end
  end
  
  def upgrade
    @user = User.find_by(id: params[:id])
    @user.update_attribute(:admin, true)
    redirect_to "/allusers"
  end
  
  def downgrade
    @user = User.find_by(id: params[:id])
    @user.update_attribute(:admin, false)
    redirect_to "/allusers"
   end

  def block
    @user = User.find_by(id: params[:id])
    @user.update_attribute(:blocked, true)
    redirect_to "/allusers"
  end
  
  def unblock
    @user = User.find_by(id: params[:id])
    @user.update_attribute(:blocked, false)
    redirect_to "/allusers"
  end

    def sod
          if current_user.blocked == true
      redirect_to '/contacts/new'
      flash[:notice] = "You have been blocked! Please contact the admin if you think this is an error"
    else
    if  user_signed_in? == false 
      redirect_to '/'
      flash[:notice] = "You need to register or log in first"
    end
end
  end





end
