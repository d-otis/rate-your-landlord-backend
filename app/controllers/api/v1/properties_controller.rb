class Api::V1::PropertiesController < ApplicationController
  def index
    properties = Property.order(created_at: :desc)

    render json: PropertySerializer.new(properties, options).serialized_json
  end

  def show
    property = Property.find_by(id: params[:id])

    render json: PropertySerializer.new(property, options).serialized_json
  end

  def create
    property = Property.new(property_params)

    if property.save
      render json: PropertySerializer.new(property, options).serialized_json
    else
      render json: {}, status: 500
      # handle errors
    end
  end

  private

  def options
    options = {
      include: [:reviews]
    }
  end

  def property_params
    params.require(:property).permit(:address, :landlord_id, :image_url)
  end
end
