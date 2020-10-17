class Api::V1::PropertiesController < ApplicationController
  def index
    properties = Property.order(created_at: :desc)

    render json: PropertySerializer.new(properties).serialized_json
  end
end
