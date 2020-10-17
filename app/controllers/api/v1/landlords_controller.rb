class Api::V1::LandlordsController < ApplicationController
  def index
    landlords = Landlord.order(created_at: :desc)

    render json: LandlordSerializer.new(landlords, options).serialized_json
  end

  private

# add in once properties serializer is fleshed out
  def options
    options = {
      include: [:properties]
    }
  end
end
