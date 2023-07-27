# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user); 
    user ||= User.new

    if user.role == 'admin'
      can :destroy, Post, author: user
    end
  end
end
