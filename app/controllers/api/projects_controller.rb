module Api
  class ProjectsController < ApplicationController
    load_and_authorize_resource through: :current_user
    

    def index
      render :json => @projects, status: 200
    end

    def create
      if @project.save
         render :json => @project, status: 200
      else
         render :json => {:errors => @project.errors.full_messages}
      end
    end

    def update
      if @project.update(project_params)
         render :json => @project, status: 200
      else
         render :json => {:errors => @project.errors.full_messages}
      end
    end

    def destroy
      @project.destroy
      render :json => @project, status: 200
    end

    private

    def project_params
      params.require(:project).permit(:title)
    end
  end
end