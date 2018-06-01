class Ability
  include CanCan::Ability

  def initialize(user)
    
    can :read, :all
    
    #이 user는 devise의 current_user에 해당함.
    if user.present?
      
      # manage : CRUD 모두를 의미함
      can :manage, Post, user_id: user.id
      
      # 좋아요 가능
      can :like, Post
      
      # User의 id와 current_user의 id가 일치하는 경우, 해당 사용자로 로그인했다면
      # update action 허용
      can :update, User, id: user.id

      # admin 권한이 있다면 모든 manage가 가능
      if user.has_role?(:admin)
        can :manage, :all
      end


      can :follow, User do |u|
        u != user
        # 여기 u는 follow 대상, user는 로그인해 있는 사용자
      end
    end
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
