class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid
    
    def create
        signup = Signup.create!(signup_params)
        activity = signup.activity
        render json: activity, status: :created
    end

    private

    def signup_params
        params.permit(:time,:camper_id,:activity_id)
    end

    def invalid
        render json: {errors: ["validation errors"]}, status: :unprocessable_entity
    end
end
