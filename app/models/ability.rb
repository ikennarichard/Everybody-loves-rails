# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user); 
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, Post, author: user
      can :read, Comment, author: user
    end
  end
end
