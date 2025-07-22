# class Ability
#   include CanCan::Ability

#   def initialize(user)
#     user ||= User.new # guest user

#     if user.admin?
#       can :manage, :all
#     else
#       can [ :show, :index ], Product  # Only allow viewing one product
#     end
#   end
# end
