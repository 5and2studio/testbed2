class Ability
  include CanCan::Ability

  def initialize(user)
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

    user ||= User.new

    # store user for reference elsewhere in this thread
    User.current = user

    can(:manage, :all) and return if user.is_admin?

    user.permissions.each do |permission|
      conditions = {}
      conditions = JSON.parse(permission.conditions) unless permission.conditions.blank?

      # if the noun represents a Class, it will be able to constantize
      # otherwise, we have to turn it to a symbol
      begin
        can permission.verb.to_sym, permission.noun.constantize, conditions
      rescue
        can permission.verb.to_sym, permission.noun.to_sym, conditions
      end
    end
  end
end
