require 'rails_helper'
require "cancan/matchers"

describe Ability do

  subject { ability }
  let(:ability){ Ability.new(user) }
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:project) { create(:project, user_id: user.id) }
  let(:project2) { create(:project, user_id: user2.id) }
  let(:task) { create(:task, project_id: project.id) }
  let(:task2) { create(:task, project_id: project2.id) }
  let(:comment) { create(:comment, task_id: task.id) }
  let(:comment2) { create(:comment, task_id: task2.id) }
  let(:supplement) { create(:supplement, comment_id: comment.id) }
  let(:supplement2) { create(:supplement, comment_id: comment2.id) }

  # subject(:ability) { Ability.new(user) }

  context "can" do
    
    it { expect(ability).to be_able_to :index, Project.new }
    it { expect(ability).to be_able_to :create, Project.new }
    it { expect(ability).to be_able_to :update, project }
    it { expect(ability).to be_able_to :destroy, project }

    it { expect(ability).to be_able_to :create, Task.new }
    it { expect(ability).to be_able_to :update, task }
    it { expect(ability).to be_able_to :destroy, task }

    it { expect(ability).to be_able_to :create, Comment.new }
    it { expect(ability).to be_able_to :destroy, comment }

    it { expect(ability).to be_able_to :create, Supplement.new }
    it { expect(ability).to be_able_to :create, supplement }
  end

  context "cannot" do

    it { expect(ability).not_to be_able_to :update, project2 }
    it { expect(ability).not_to be_able_to :destroy, project2 }

    it { expect(ability).not_to be_able_to :update, task2 }
    it { expect(ability).not_to be_able_to :destroy, task2 }

    it { expect(ability).not_to be_able_to :destroy, comment2 }

    it { expect(ability).not_to be_able_to :destroy, supplement2 }
  end
end
