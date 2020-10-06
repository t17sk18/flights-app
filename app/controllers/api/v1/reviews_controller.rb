module Api
    module v1
        class ReviewsController < ApplicationController


            def create
                review = Review.new(review_params)

                if review.save
                    renser json: ReviewSerializer.new(review).serialized_json
                else
                    rensder json: {error: review.errors.messages}, status: 422
                end
            end


            def destroy
                review = Review.find(params[:id])

                if review.destroy
                    head :no_content
                else
                    rensder json: {error: review.errors.messages}, status: 422
                end
            end


            private

            def review_param
                params.require(:review).permit(:title, :description, :score, :airline_id)
            end
        end
    end
end