class ProfilesController < ApplicationController
  #сделать нормальынй поиск перед методами
  def show
    @catch = Catch.new
    @profile = Profile.find_by(id: params[:id])
    if @profile.nil?
      render 'public/404.html.erb'
    elsif @profile.user != current_user
      render 'public/403.html.erb'
    else
      @profile
    end
  end

  def edit
    @catch = Catch.new
    @profile = Profile.find(params[:id])
  end

  def update
    @catch = Catch.new
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
