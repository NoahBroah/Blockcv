class VerificationsController < ApplicationController
    def create
        employer = @current_user
        verification = employer.verifications.create(verification_params)
        if verification.valid? && (session[:is_employer] === 1)
            render json: verification, status: :created
        else
            render json: { errors: verification.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def index
        verifications = Verification.all
        render json: verifications, status: :ok
    end

    def show
        verification = Verification.find_by(id: params[:id])
        render json: verification, status: :ok
    end

    # def update
    #     employer = @current_user
    #     verification = Verification.find_by(id: params[:id])
    #     # verification = employer.verifications.find_by(id: params[:id])
    #     if session[:is_employer] === 1 
    #         verification.update(verification_params)
    #         render json: verification, status: :created
    #     else
    #         render json: { errors: verification.errors.full_messages }, status: :unprocessable_entity
    #     end
    # end



    private

    def verification_params
        params.permit(:is_verified, :id, :employee_id)
    end
end
