class Api::V1::ReviewsController < ApplicationController

  def index
    reviews = Review.all

    render json: ReviewSerializer.new(reviews).serialized_json
  end

end
