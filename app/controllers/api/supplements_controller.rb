module Api
  class SupplementsController < ApplicationController
    load_resource :comment
    load_and_authorize_resource :supplement, through: :comment
    skip_before_filter :verify_authenticity_token  

    def create
      if @supplement.save
        render :json => @supplement, status: 200
      else
        render :json => @supplement.errors, status: 400
      end
    end

    def destroy
      @supplement.destroy
      render :json => @supplement, status: 200
    end

    private

    def supplement_params
      params.permit(:file)
    end
  end
end