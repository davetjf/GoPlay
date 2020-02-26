class PagesController < ApplicationController
  def home
  	# Below code user to make the first admin
  	#current_user.update_attribute :admin, true
  end

  def dashboard
    if  user_signed_in? == false 
      redirect_to '/'
      flash[:notice] = "You need to register or log in first"
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





end
