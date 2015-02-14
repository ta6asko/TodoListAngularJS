class Ability
  include CanCan::Ability

  def initialize(user)
      can [:create, :index], Project 
      can [:update, :destroy], Project do |project|
        project.user == user
      end
      can :create, Task
      can [:update, :destroy], Task do |task|
        task.project.user == user
      end
      can :create, Comment
      can [:destroy], Comment do |comment|
        comment.task.project.user == user
      end
      can :create, Supplement
      can [:destroy], Supplement do |supplement| 
        supplement.comment.task.project.user == user
      end  

      cannot [:update, :destroy], Project do |project|
        project.user != user
      end
      cannot [:update, :destroy], Task do |task|
        task.project.user != user
      end
      cannot :destroy, Comment do |comment|
        comment.task.project.user != user
      end
      cannot :destroy, Supplement do |supplement| 
        supplement.comment.task.project.user != user
      end  
  end
end
 