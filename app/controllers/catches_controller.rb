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

    if @catch.save
      ActionCable.server.broadcast "fish_index_channel",
                                   content: [@catch.name, @catch.weight, @catch.place, @catch.date]
    else
      respond_to do |format|
        format.js {render inline: "location.reload();" }
      end
    end
  end

  private

  def catch_params
    params.require(:catch).permit(
      :weight, :size, :name, :place, :date
    )
  end
end
