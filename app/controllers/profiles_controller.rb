class ProfilesController < ApplicationController

  def show
    @profile = Profile.find(params[:id])
  end

  def new
  end

  def edit
  end

  def update
  end

end
