class Api::V1::PropertiesController < ApplicationController
  def index
    properties = Property.order(created_at: :desc)

    render json: PropertySerializer.new(properties, options).serialized_json
  end

  private

  def options
    options = {
      include: [:reviews]
    }
  end
end
