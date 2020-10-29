class Api::V1::LandlordsController < ApplicationController

  def index
    landlords = Landlord.order(created_at: :desc)

    render json: LandlordSerializer.new(landlords, options).serialized_json
  end

  def show
    landlord = Landlord.find_by(id: params[:id])

    render json: LandlordSerializer.new(landlord, options).serialized_json
  end

  def create
    landlord = Landlord.new(landlord_params)

    if landlord.save
      render json: LandlordSerializer.new(landlord, options).serialized_json
    else
      # send error message
      # based on validation errors
      render json: {}, status: 500
    end
  end

  def update
    landlord = Landlord.find_by(id: params[:id])

    if landlord.update(landlord_params)
      render json: LandlordSerializer.new(landlord, options).serialized_json
    else
      # handle this error, bro
      render json: {}, status: 500
    end
  end

  private

# add in once properties serializer is fleshed out
  def options
    options = {
      include: [:properties, :reviews]
    }
  end

  def landlord_params
    params.require(:landlord).permit(:name)
  end

end
