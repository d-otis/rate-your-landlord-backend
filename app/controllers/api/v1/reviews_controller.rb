class Api::V1::ReviewsController < ApplicationController

  def index
    reviews = Review.all

    render json: ReviewSerializer.new(reviews).serialized_json
  end

  def create
    binding.pry
    # make sure to trigger rating update 
    # after this review is created 
    # for landlord AND property
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating, :property_id)
  end

end
