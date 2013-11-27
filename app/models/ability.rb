class Ability
  include CanCan::Ability
  def initialize(user)
    return nil unless user
    can :manage, :all if user.administrator?
    can :manage, Factor  if user.manager?
    can :manage, Lecturer if user.manager?
  end
end
