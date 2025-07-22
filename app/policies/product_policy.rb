class ProductPolicy < ApplicationPolicy
  def index?
    true  # Everyone can view the list
  end

  def show?
    true  # Everyone can view a product
  end

  def create?
    user.has_role?(:admin)
  end

  def new?
    create?
  end

  def update?
    user.has_role?(:admin)
  end

  def edit?
    update?
  end

  def destroy?
    user.has_role?(:admin)
  end

  class Scope < Scope
    def resolve
      if user.has_role?(:admin)
        scope.all
      else
        scope.where(user_id: user.id)  # or scope.where(published: true) if needed
      end
    end
  end
end
