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
      binding.pry
      # return the newly created thing in JSON
      render json: LandlordSerializer.new(landlord, options).serialized_json
    else
      # send error message
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
