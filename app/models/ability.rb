class Ability
  include CanCan::Ability
  def initialize(user)
    return nil unless user
    can :manage, :all if user.administrator?
    can :index,:show,  Value if user.manager?
  end
end
