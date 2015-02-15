module Api
  class CommentsController < ApplicationController
    load_resource :task
    load_and_authorize_resource :comment, :through => :task

    def create
      if @comment.save
        render :json => @comment, status: 200
      else
        render :json => @comment.errors, status: 400
      end
    end

    def destroy
      @comment.destroy
      render :json => @comment, status: 200
    end

    private

    def comment_params
      params.require(:comment).permit(:text)
    end
  end
end