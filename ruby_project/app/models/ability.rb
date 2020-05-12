class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user?
    can :read, Product
    end
    
    if user.present? 
      can [:destroy, :update , :create], Product , user: { role: 'seller' } , :user => user 
    end

    if user.present? 
      can [:destroy, :update , :read], Checkout , user: { role: 'buyer' } , :user => user 
      can [:add_to_cart , :current_order], Cart , user: { role: 'buyer' } , :user => user 

    end

    
    
    #    # guest user (not logged in)
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
