# frozen_string_literal: true

class CatchesController < ApplicationController
  def index
    @catches = Catch.all
  end

  def show
    @catch = Catch.find(params[:id])
  end

  def new
    @catch = Catch.new
  end

  def create
    @catch = Catch.create(catch_params)
    @catch.profile = current_user.profile

    if @catch.valid? && @catch.save!
      respond_to do |format|
        format.turbo_stream
        format.html {render inline: "location.reload();" }
      end
    else
      redirect_to profile_path(current_user.profile)
    end
  end

  private

  def catch_params
    params.require(:catch).permit(
      :weight, :size, :name, :place, :date
    )
  end
end
