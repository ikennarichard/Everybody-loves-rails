# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user); 
    user ||= User.new

    if user.admin?
      can :manage, Post
    else
      can :read, Post
    end
  end
end
