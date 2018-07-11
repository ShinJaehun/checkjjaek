class Ability
  include CanCan::Ability

  def initialize(user)
    # 모든 사용자에게 read 허용
    can :read, :all
    
    #이 user는 devise의 current_user(즉, 로그인에 성공한 사용자)에 해당
    if user.present?
      # current_user에게 admin 권한이 있다면 모든 resource에 대해 manage가 가능
      if user.has_role?(:admin)
        can :manage, :all
      end      

      # current_user는 Post의 manage 가능 : CRUD 모두를 의미함
      can :manage, Post, user_id: user.id
      
      # current_user는 posts#action 가능
      can :like, Post
      
      # User의 id와 current_user의 id가 일치하는 경우, 해당 사용자로 로그인했다면
      # users#update 가능
      can :update, User, id: user.id

      # current_user가 현재 페이지의 user가 아니라면 users#follow 가능
      can :follow, User do |u|
        u != user
        # 여기 u는 현재 페이지의 user이자 follow 대상(즉 followee),
        # user는 current_user이자 follower
      end
      
      # Comment 모델에 대한 권한 설정
      # admin이라면 모든 resource에 대해 manage가 가능하므로 별도로 지정할 필요는 없음
      can :create, Comment
      can :destroy, Comment, user_id: user.id
      
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
