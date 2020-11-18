# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update destroy]

  # GET /listings/1
  def show; end

  # GET /listings/new
  def new
    @profile = current_user.build_profile
  end

  # POST /listings
  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path(@profile.id)
    else
      render :new
    end
  end

  # GET /listings/1/edit
  def edit
    @profile = current_user.profile
  end

  # PATCH/PUT /listings/1
  def update
    @profile.update(profile_params)
    redirect_to profile_path(@profile.id)
  end

  # DELETE /listings/1
  def destroy
    @profile.destroy
    redirect_to profiles_path
  end

  private

  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:profile).permit(:fullname, :description, :avatar)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end
end
