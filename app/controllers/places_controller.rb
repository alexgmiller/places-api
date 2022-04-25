class PlacesController < ApplicationController
  def index
    @places = Places.all
    render :index
  end

  def create
    @places = Places.new(
                           name: params[:name],
                           address: params[:address]
                          )

    if @places.save
      render :show
    else
      render json: {errors: @places.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @places = Places.find(params[:id])
    render :show
  end

  def update
    @places = Places.find(params[:id])

    @places.name = params[:name] || @places.name
    @places.address = params[:address] || @places.address

    if @places.save
      render :show
    else
      render json: {errors: @places.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    places = Places.find(params[:id])
    places.destroy
    render json: {message: "Successfully Destroyed places"}
  end
end
