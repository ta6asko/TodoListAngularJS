require 'controllers/controllers_spec_helper'

describe Api::ProjectsController do

  before do
    @user = create(:user)
    allow(controller).to receive(:current_user) { @user }
    @project = create(:project, user_id: @user.id)

    redefine_cancan_abilities
  end

  describe "GET #index" do
    context 'being signed in' do

      before do
        sign_in @user
      end

      it "responds successfully with an HTTP 200 status code" do
        get :index
        expect(response.status).to eq(200)
      end
    end

    context 'being not signed in' do
      
      before do
        get :index
      end

      it { expect(response).to redirect_to(new_user_session_path) }
    end

    context 'cancan doesnt allow :index' do
      before do
        sign_in @user
        @ability.cannot :index, Project
        get :index
      end

      it { should redirect_to root_path }
    end
  end

  describe "POST #create" do
    context 'being signed in' do

      before do
        sign_in @user
      end

      it "responds successfully with an HTTP 200 status code" do
        post :create, project: attributes_for(:project, user_id: @user.id)
        expect(response.status).to eq(200)
      end
    end

    context 'being not signed in' do
      
      before do
        post :create, project: attributes_for(:project, user_id: @user.id)
      end

      it { expect(response).to redirect_to(new_user_session_path) }
    end

    context 'cancan doesnt allow :create' do
      before do
        sign_in @user
        @ability.cannot :create, Project
        post :create, project: attributes_for(:project) 
      end

      it { should redirect_to root_path }
    end
  end

  describe "PUT #update" do
    context 'being signed in' do

      before do
        sign_in @user
      end

      it "responds successfully with an HTTP 200 status code" do
        put :update, id: @project.id, project: attributes_for(:valid_project) 
        expect(response.status).to eq(200)
      end

    end

    context 'being not signed in' do
      
      before do
        put :update, id: @project.id, project: attributes_for(:valid_project)
      end

      it { expect(response).to redirect_to(new_user_session_path) }
    end

    context 'cancan doesnt allow :update' do
      before do
        sign_in @user
        @ability.cannot :update, Project
        patch :update, id: @project.id, project: attributes_for(:project, project: "Test")
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
        delete :destroy, id: @project.id
      end
    end

    context 'being not signed in' do
      
      before do
        delete :destroy, id: @project.id
      end

      it { expect(response).to redirect_to(new_user_session_path) }
    end

    context 'cancan doesnt allow :destroy' do
      before do
        sign_in @user
        @ability.cannot :destroy, Project
        delete :destroy, id: @project.id
      end

      it { should redirect_to root_path }
    end
  end
end
