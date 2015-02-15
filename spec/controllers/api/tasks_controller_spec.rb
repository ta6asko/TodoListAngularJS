require 'controllers/controllers_spec_helper'

describe Api::TasksController do

  let(:task_attrs) { attributes_for(:task) }
  let(:invalid_task_attrs) { attributes_for(:task, title: nil) }

  before do
    @user = create(:user)
    allow(controller).to receive(:current_user) { @user }
    @project = create(:project, user_id: @user.id)
    @task = create(:task, project_id: @project.id)
    redefine_cancan_abilities
  end

  describe "POST #create" do
    context 'being signed in' do
      
      before do
        sign_in @user
      end

      it "responds successfully with an HTTP 200 status code" do
        post :create, project_id: @project.id, task: task_attrs
        expect(response.status).to eq(200)
      end

      it "should respond with status 400 on invalid request" do
        post :create, project_id: @project.id, task: invalid_task_attrs
        expect(response.status).to eq(400)
      end
    end

    context 'being not signed in' do
      
      before do
        post :create, project_id: @project.id, task: task_attrs
      end

      it { expect(response).to redirect_to(new_user_session_path) }
    end

    context 'cancan doesnt allow :create' do
      before do
        sign_in @user
        @ability.cannot :create, Task
        post :create, project_id: @project.id, task: task_attrs 
      end

      it { should redirect_to root_path }
    end
  end

  describe "POST #update" do
    context 'being signed in' do

      before do
        sign_in @user
      end

      it "responds successfully with an HTTP 200 status code" do
        put :update, id: @task.id, project_id: @project.id, task: task_attrs 
        expect(response.status).to eq(200)
      end

      it "should respond with status 400 on invalid request" do
        put :update, id: @task.id, project_id: @project.id, task: invalid_task_attrs
        expect(response.status).to eq(400)
      end
    end

    context 'being not signed in' do
      
      before do
        put :update, id: @task.id, project_id: @project.id, task: task_attrs  
      end

      it { expect(response).to redirect_to(new_user_session_path) }
    end

    context 'cancan doesnt allow :update' do
      before do
        sign_in @user
        @ability.cannot :update, Task
        put :update, id: @task.id, project_id: @project.id, task: task_attrs
      end

      it { should redirect_to root_path }
    end
  end

  describe "DELETE #destroy" do
    context 'being signed in' do

      before do
        sign_in @user
      end

      it "responds successfully with an HTTP 200 status code" do
        
        delete :destroy, id: @task.id, project_id: @project.id, task: task_attrs 
      end
    end

    context 'being not signed in' do
      
      before do
        delete :destroy, id: @task.id, project_id: @project.id, task: task_attrs 
      end

      it { expect(response).to redirect_to(new_user_session_path) }
    end

    context 'cancan doesnt allow :destroy' do
      before do
        sign_in @user
        @ability.cannot :destroy, Task
        delete :destroy, id: @task.id, project_id: @project.id, task: task_attrs
      end

      it { should redirect_to root_path }
    end
  end

		
end