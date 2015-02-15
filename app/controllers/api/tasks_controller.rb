module Api
	class TasksController < ApplicationController
		load_resource :project
  	load_and_authorize_resource :task, through: :project

		def create
			if @task.save
				render :json => @task, status: 200
			else
				render :json => @task.errors, status: 400
			end
		end

		def update
			if @task.update(task_params)
			  render :json => @task, status: 200
			else
				render :json => @task.errors, status: 400
			end
		end

		def destroy			
			render :json => @task.destroy, status: 200
		end

		private

		def task_params
			params.require(:task).permit(:title, :position, :completed, :deadline)
		end
	end
end