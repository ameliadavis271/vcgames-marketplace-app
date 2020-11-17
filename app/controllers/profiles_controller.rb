# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update destroy]

  def show; end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path(@profile.id)
    else
      render :new
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile.update(profile_params)
    redirect_to profile_path(@profile.id)
  end

  def destroy
    @profile.destroy
    redirect_to profiles_path
  end

  private

  def profile_params
    params.require(:profile).permit(:fullname, :description, :avatar)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
