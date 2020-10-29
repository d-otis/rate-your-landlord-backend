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
    
  end

  private

  def options
    options = {
      include: [:reviews]
    }
  end
end
