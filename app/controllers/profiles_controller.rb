class ProfilesController < ApplicationController
  #сделать нормальынй поиск перед методами
  def show
    @profile = Profile.find_by(id: params[:id])
    if @profile.nil?
      render 'public/404'
    elsif @profile.user != current_user
      render 'public/403'
    else
      @profile
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.name = profile_params[:name]
    @profile.lastname = profile_params[:lastname]
    @profile.save
    render 'show'
  end

  def profile_params
    params.require(:profile).permit(:name, :lastname)
  end
end
