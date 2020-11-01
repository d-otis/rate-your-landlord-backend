class Api::V1::ReviewsController < ApplicationController

  def index
    reviews = Review.all

    render json: ReviewSerializer.new(reviews).serialized_json
  end

  def create
    review = Review.new(reviews_params)

    if review.save
      set_ratings(review)

      render json: ReviewSerializer.new(review).serialized_json
    else
      render json: {}, status: 500
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating, :property_id)
  end

  def set_ratings(review)
    review.property.set_rating
    review.property.landlord.set_rating
  end

end
