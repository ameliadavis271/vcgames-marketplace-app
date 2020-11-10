class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update, :destroy]  
  before_action :authenticate_user!, except: [:show]
  
  def index
    @profile = Profile
  end
  
  def show
    @profile = Profile.find(profile_params)
  end
  
  def edit
    @profile = Profile.find(params[:id])
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
  
  def find_profile
    @profile = Profile.find(params[:id])
  end

end
  