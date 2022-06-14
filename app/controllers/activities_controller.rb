class ActivitiesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid
    
        def index
            activities = Activity.all
            render json: activities
        end
    
        def show
            activity = Activity.find(params[:id])
            render json: activity
        end
    
        def create
            activity = activity.create!(activity_params)
            render json: activity, status: :created
        end
        
        def destroy
            activity = Activity.find(params[:id])
            activity.destroy
            head :no_content
        end
    
    
        private
    
        def record_not_found
            render json: { error: "Activity not found"}, status: :not_found
        end
    
        def activity_params
            params.permit(:name, :difficulty)
        end
    
        def invalid
            render json: {errors: "validation errors"}, status: :unprocessable_entity
        end
    
end
