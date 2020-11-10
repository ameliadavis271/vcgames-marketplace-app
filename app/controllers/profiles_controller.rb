class ProfilesController < ApplicationController
  
  def index
  end
  
  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    
  
  def edit
    @profile = current_user.profile
  end
  
  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    redirect_to profiles_path
  end
  
  private
  
  def profile_params
    params.require(:listing).permit(:fullname, :description, :avatar)
  end
end
  