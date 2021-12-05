# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.role == "admin"
    can :read, :professionals if user.role == "assistant"
    can :manage, :appointments if user.role == "assistant"
    can :read, :all if user.role == "watcher"
  end
end
